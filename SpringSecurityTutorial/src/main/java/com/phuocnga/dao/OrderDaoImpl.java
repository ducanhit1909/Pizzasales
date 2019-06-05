package com.phuocnga.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phuocnga.model.OrderDetailEntity;
import com.phuocnga.model.OrderDetailId;
import com.phuocnga.model.OrderEntity;
import com.phuocnga.model.OrderMethodEntity;
import com.phuocnga.model.ProductEntity;
import com.phuocnga.model.ProductToppingEntity;
import com.phuocnga.model.SizeEntity;
import com.phuocnga.model.UserEntity;

@Repository
public class OrderDaoImpl implements IOrderDao {

	@Autowired
	SessionFactory factory;
	@Autowired
	UserDao userDao;

	@Override
	public Integer checkOrderExsist(String email) {
		String hql = "Select orderEntity.id FROM OrderEntity orderEntity JOIN orderEntity.userEntity userEntity where userEntity.email=:email and orderEntity.status=:status";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		query.setParameter("status", false);
		try {
			return (Integer) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public Integer createOrderByEmail(String email) {
		Session session = factory.getCurrentSession();
		OrderEntity orderEntity = new OrderEntity();
		UserEntity userEntity = userDao.getUserFromEmail(email);
		orderEntity.setUserEntity(userEntity);
		return (int) session.save(orderEntity);
	}

	@Override
	public boolean checkOrderDetailExist(int orderId, int productId, int productToppingId, int productSizeId) {
		Session session = factory.getCurrentSession();
		OrderDetailEntity orderDetail = session.get(OrderDetailEntity.class,
				new OrderDetailId(orderId, productId, productToppingId, productSizeId));
		if (orderDetail == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public String createOrderDetail(int orderId, int productId, int productToppingId, int productSizeId) {
		Session session = factory.getCurrentSession();
		OrderEntity orderEntity = session.get(OrderEntity.class, orderId);
		ProductEntity productEntity = session.get(ProductEntity.class, productId);
		SizeEntity sizeEntity = session.get(SizeEntity.class, productId);
		ProductToppingEntity topping = session.get(ProductToppingEntity.class, productToppingId);
		OrderDetailId orderDetailId = new OrderDetailId(orderId, productId, productToppingId, productSizeId);
		OrderDetailEntity orderDetail = new OrderDetailEntity(orderDetailId, orderEntity, productEntity, topping,
				sizeEntity, 1);
		session.save(orderDetail);
		return productEntity.getName();
	}

	@Override
	public String updateOrderDetail(int orderId, int productId, int productToppingId, int productSizeId, int quantity) {
		Session session = factory.getCurrentSession();
		OrderDetailEntity orderDetail = session.get(OrderDetailEntity.class,
				new OrderDetailId(orderId, productId, productToppingId, productSizeId));
		orderDetail.setQuantity(orderDetail.getQuantity() + quantity);
		session.merge(orderDetail);
		return orderDetail.getProductEntity().getName();
	}

	public OrderMethodEntity getOrderMethod(int orderMethodId) {
		Session session = factory.getCurrentSession();
		OrderMethodEntity orderMethod = session.get(OrderMethodEntity.class, orderMethodId);
		return orderMethod;
	}

	@Override
	public Long calculateTotalQuantityOfOrder(int orderId) {
		String hql = "SELECT sum(oddt.quantity) FROM OrderDetailEntity oddt WHERE oddt.orderEntity.id=:orderId GROUP BY oddt.orderEntity.id";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("orderId", orderId);
		try {
			return (Long) query.getSingleResult();
		} catch (NoResultException e) {
			return new Long(0);
		}
	}

	public Double calculateTotalPriceOfOrder(int orderId) {
		String hql = "Select sum(oddt.quantity*pdsize.price) from OrderDetail oddt join Product_Size pdsize on oddt.productId=pdsize.product_id and oddt.productSizeId=pdsize.product_size where oddt.orderId=:orderId group by oddt.orderId";
		Session session = factory.getCurrentSession();
		Query query = session.createNativeQuery(hql);
		query.setParameter("orderId", orderId);
		try {
			return (Double) query.getSingleResult();
		} catch (NoResultException e) {
			return new Double(0);
		}
	}

	@Override
	public List<OrderDetailEntity> getOrderDetailByUser(Integer orderId) {
		String hql = "Select orderDetail from OrderDetailEntity orderDetail join orderDetail.orderEntity orderEntity where orderEntity.id=:orderId";
		Query query = factory.getCurrentSession().createQuery(hql);
		query.setParameter("orderId", orderId);
		List<OrderDetailEntity> result = query.getResultList();
		return result;
	}

	@Override
	public void deleteOrderDetail(OrderDetailId orderDetailId) {
		Session session = factory.getCurrentSession();
		OrderDetailEntity orderDetail = session.get(OrderDetailEntity.class, orderDetailId);
		session.remove(orderDetail);
	}

	@Override
	public void updateQuantityOfOrder(int orderId, int productId, int productToppingId, int productSizeId,
			int quantity) {
		Session session = factory.getCurrentSession();
		OrderDetailEntity orderDetail = session.get(OrderDetailEntity.class,
				new OrderDetailId(orderId, productId, productToppingId, productSizeId));
		orderDetail.setQuantity(quantity);
		session.merge(orderDetail);
	}

	@Override
	public void placeOrder(int orderId, int orderMethod) {
		String hql = "Update OrderEntity set status=:status,orderMethod.id=:orderMethod where id=:orderId";
		Query query = factory.getCurrentSession().createQuery(hql);
		query.setParameter("status", true);
		query.setParameter("orderMethod", orderMethod);
		query.setParameter("orderId", orderId);
		query.executeUpdate();
	}

}
