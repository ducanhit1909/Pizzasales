package com.phuocnga.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.phuocnga.dao.ProductDao;
import com.phuocnga.model.ProductCategoryEntity;
import com.phuocnga.model.ProductEntity;
import com.phuocnga.model.ProductToppingEntity;
import com.phuocnga.model.SizeEntity;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao pdDao;

	@Override
	public ProductEntity getProduct(int id) {
		// TODO Auto-generated method stub
		return pdDao.getProduct(id);
	}

	@Override
	public int totalOfPage(int numberElementOfEachPage) {
		// TODO Auto-generated method stub
		return pdDao.totalOfPage(numberElementOfEachPage);
	}

	@Override
	public List<ProductEntity> paginationPage(int startPoint, int numberElementOfEachPage) {
		// TODO Auto-generated method stub
		return pdDao.paginationPage(startPoint, numberElementOfEachPage);
	}

	@Override
	public List<ProductEntity> getAllProducts() {
		return pdDao.getAllProducts();
	}

	@Override
	public List<ProductToppingEntity> toppings() {
		return pdDao.toppings();
	}

	@Override
	public List<SizeEntity> sizes() {
		return pdDao.sizes();
	}

	@Override
	public List<ProductCategoryEntity> categories() {
		return pdDao.categories();
	}

	@Override
	public void addProduct(String pizzaName, Integer category, String description, int[] sizes, int[] topping,
			String image) {
		pdDao.addProduct(pizzaName, category, description, sizes, topping, image);
	}

	@Override
	public void updateProduct(int id, String pizzaName, Integer category, String description, int[] sizes,
			List<Float> price, int[] topping, String image) {
		pdDao.updateProduct(id, pizzaName, category, description, sizes, price, topping, image);
		
	}

}
