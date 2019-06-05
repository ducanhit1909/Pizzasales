package com.phuocnga.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phuocnga.model.ProductCategoryEntity;
import com.phuocnga.model.ProductEntity;
import com.phuocnga.model.ProductSizeEntity;
import com.phuocnga.model.ProductSizeId;
import com.phuocnga.model.ProductToppingEntity;
import com.phuocnga.model.SizeEntity;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SessionFactory factory;

	@Override
	public ProductEntity getProduct(int id) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("From ProductEntity where id=:id");
		query.setParameter("id", id);
		ProductEntity product;
		try {
			product = (ProductEntity) query.getSingleResult();
		} catch (NoResultException e) {
			product = null;
		}
		return product;
	}

	@Override
	public List<ProductEntity> paginationPage(int startPoint, int numberElementOfEachPage) {
		// Calculate page number
		Query query1 = factory.getCurrentSession().createQuery("from ProductEntity");
		query1.setFirstResult(startPoint);
		query1.setMaxResults(numberElementOfEachPage);
		List<ProductEntity> result = query1.getResultList();
		return result;
	}

	@Override
	public int totalOfPage(int numberElementOfEachPage) {
		String hql = "Select count(id) from ProductEntity";
		Query query = factory.getCurrentSession().createQuery(hql);
		long countResult = (long) query.getSingleResult();
		int lastPageNumber = (int) (Math.ceil((double) countResult / numberElementOfEachPage));
		return lastPageNumber;
	}

	/* Product managements */
	@Override
	public List<ProductEntity> getAllProducts() {
//		 String nativeHql = "SELECT
//		 product.name,cate.pizzaCategory,size.size,topping.[type],product_size.price
//		 FROM Products product JOIN Product_Size product_size on
//		 product.id=product_size.product_id JOIN Size size on
//		 size.id=product_size.product_size JOIN Product_Topping product_topping on
//		 product.id=product_topping.product_id JOIN Topping topping on
//		 product_topping.product_topping=topping.id JOIN Category cate on
//		 cate.id=product.pizzaCategory";
		String hql = "From ProductEntity";
		Query query = factory.getCurrentSession().createQuery(hql);
		return query.getResultList();
	}

	@Override
	public List<ProductToppingEntity> toppings() {
		String hql = "From ProductToppingEntity";
		Query query = factory.getCurrentSession().createQuery(hql);
		return query.getResultList();
	}

	@Override
	public List<SizeEntity> sizes() {
		String hql = "From SizeEntity";
		Query query = factory.getCurrentSession().createQuery(hql);
		return query.getResultList();
	}

	@Override
	public List<ProductCategoryEntity> categories() {
		String hql = "From ProductCategoryEntity";
		Query query = factory.getCurrentSession().createQuery(hql);
		return query.getResultList();
	}

	public ProductCategoryEntity getCategory(Integer categoryId) {
		return factory.getCurrentSession().get(ProductCategoryEntity.class, categoryId);
	}

	public List<ProductToppingEntity> getToppings(int[] toppings) {
		ProductToppingEntity productTopping;
		List<ProductToppingEntity> productToppings = new ArrayList<ProductToppingEntity>();
		for (int i : toppings) {
			productTopping = factory.getCurrentSession().get(ProductToppingEntity.class, i);
			productToppings.add(productTopping);
		}
		return productToppings;
	}

	public void getSizes(int[] sizeId, ProductEntity product, Session session) {
		ProductSizeId productSizeId;
		ProductSizeEntity productSize;
		SizeEntity size;
		for (int i : sizeId) {
			productSize = new ProductSizeEntity();
			size = session.get(SizeEntity.class, i);
			productSizeId = new ProductSizeId(product.getId(), i);
			// Set ProductSize
			productSize.setProductSizeId(productSizeId);
			productSize.setProduct(product);
			productSize.setSizeEntity(size);
			session.persist(productSize);
		}
	}

	@Override
	public void addProduct(String pizzaName, Integer category, String description, int[] sizes, int[] topping,
			String image) {
		ProductEntity p = new ProductEntity();
		p.setName(pizzaName);
		p.setDescription(description);
		p.setImage(image);
		p.setProductCategory(getCategory(category));
		p.setProductToppings(getToppings(topping));
		Session session = factory.getCurrentSession();
		session.persist(p);
		getSizes(sizes, p, session);
	}

	@Override
	public void updateProduct(int id, String pizzaName, Integer category, String description, int[] sizes,
			List<Float> price, int[] topping, String image) {
		Session session = factory.getCurrentSession();
		ProductEntity productEntity = session.get(ProductEntity.class, id);
		productEntity.setName(pizzaName);
		productEntity.setDescription(description);
		productEntity.setProductCategory(getCategory(category));
		productEntity.setProductToppings(getToppings(topping));
		if(image!=null) {
			productEntity.setImage(image);			
		}
		for (int i = 0; i < productEntity.getProductSizes().size(); i++) {
			productEntity.getProductSizes().get(i).setPrice(price.get(i));
		}
		session.merge(productEntity);
	}

}
