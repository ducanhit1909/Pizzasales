package com.phuocnga.dao;

import java.util.List;

import com.phuocnga.model.OrderDetailEntity;
import com.phuocnga.model.OrderDetailId;

public interface IOrderDao {
	public Integer checkOrderExsist(String email);

	public Integer createOrderByEmail(String email);

	public String updateOrderDetail(int orderId, int productId, int productToppingId, int productSizeId, int quantity);

	public String createOrderDetail(int orderId, int productId, int productToppingId, int productSizeId);

	public Long calculateTotalQuantityOfOrder(int orderId);
	public Double calculateTotalPriceOfOrder(int orderId);

	public boolean checkOrderDetailExist(int orderId, int productId, int productToppingId, int productSizeId);

	public List<OrderDetailEntity> getOrderDetailByUser(Integer orderId);

	public void deleteOrderDetail(OrderDetailId orderDetailId);
	public void updateQuantityOfOrder(int orderId, int productId, int productToppingId, int productSizeId, int quantity);
	public void placeOrder(int orderId,int orderMethod);
}
