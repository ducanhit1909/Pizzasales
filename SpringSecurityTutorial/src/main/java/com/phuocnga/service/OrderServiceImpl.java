package com.phuocnga.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phuocnga.dao.IOrderDao;
import com.phuocnga.model.OrderDetailEntity;
import com.phuocnga.model.OrderDetailId;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
	@Autowired
	IOrderDao orderDao;

	@Override
	public Integer checkOrderExsist(String email) {
		return orderDao.checkOrderExsist(email);
	}

	@Override
	public Integer createOrderByEmail(String email) {
		return orderDao.createOrderByEmail(email);
	}

	@Override
	public String updateOrderDetail(int orderId, int productId, int productToppingId, int productSizeId, int quantity) {
		return orderDao.updateOrderDetail(orderId, productId, productToppingId, productSizeId, quantity);
	}

	@Override
	public String createOrderDetail(int orderId, int productId, int productToppingId, int productSizeId) {
		return orderDao.createOrderDetail(orderId, productId, productToppingId, productSizeId);
	}

	@Override
	public Long calculateTotalQuantityOfOrder(int orderId) {
		return orderDao.calculateTotalQuantityOfOrder(orderId);
	}

	@Override
	public boolean checkOrderDetailExist(int orderId, int productId, int productToppingId, int productSizeId) {
		return orderDao.checkOrderDetailExist(orderId, productId, productToppingId, productSizeId);
	}

	@Override
	public List<OrderDetailEntity> getOrderDetailByUser(Integer orderId) {
		return orderDao.getOrderDetailByUser(orderId);
	}

	@Override
	public void deleteOrderDetail(OrderDetailId orderDetailId) {
		orderDao.deleteOrderDetail(orderDetailId);
	}

	@Override
	public void updateQuantityOfOrder(int orderId, int productId, int productToppingId, int productSizeId,
			int quantity) {
		orderDao.updateQuantityOfOrder(orderId, productId, productToppingId, productSizeId, quantity);
	}

	@Override
	public Double calculateTotalPriceOfOrder(int orderId) {
		return orderDao.calculateTotalPriceOfOrder(orderId);
	}

	@Override
	public void placeOrder(int orderId, int orderMethod) {
		orderDao.placeOrder(orderId, orderMethod);
	}

}
