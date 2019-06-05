package com.phuocnga.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class OrderDetailId implements Serializable {
	int orderId;
	int productId;
	int productToppingId;
	int productSizeId;

	public OrderDetailId() {
		super();
	}

	public OrderDetailId(int orderId, int productId, int productToppingId, int productSizeId) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.productToppingId = productToppingId;
		this.productSizeId = productSizeId;
	}

	@Column(name = "orderId")
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	@Column(name = "productId")
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	@Column(name = "productToppingId")
	public int getProductToppingId() {
		return productToppingId;
	}

	public void setProductToppingId(int toppingId) {
		this.productToppingId = toppingId;
	}

	@Column(name = "productSizeId")
	public int getProductSizeId() {
		return productSizeId;
	}

	public void setProductSizeId(int sizeId) {
		this.productSizeId = sizeId;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null || getClass() != obj.getClass())
			return false;
		OrderDetailId that = (OrderDetailId) obj;
		return Objects.equals(orderId, that.orderId) && Objects.equals(productId, that.productId)
				&& Objects.equals(productSizeId, that.productSizeId)
				&& Objects.equals(productToppingId, that.productToppingId);
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return Objects.hash(orderId, productId, productSizeId, productToppingId);
	}

}
