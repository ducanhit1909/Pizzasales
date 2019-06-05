package com.phuocnga.dao;

import java.util.List;

import com.phuocnga.model.ProductCategoryEntity;
import com.phuocnga.model.ProductEntity;
import com.phuocnga.model.ProductToppingEntity;
import com.phuocnga.model.SizeEntity;

public interface ProductDao {
	public ProductEntity getProduct(int id);

	public int totalOfPage(int numberElementOfEachPage);

	public List<ProductEntity> paginationPage(int startPoint, int numberElementOfEachPage);

	public List<ProductEntity> getAllProducts();

	public List<ProductToppingEntity> toppings();

	public List<SizeEntity> sizes();

	public List<ProductCategoryEntity> categories();

	public void addProduct(String pizzaName, Integer category, String description, int[] sizes, int[] topping,
			String image);

	public void updateProduct(int id,String pizzaName, Integer category, String description, int[] sizes, List<Float> price,
			int[] topping, String image);

}
