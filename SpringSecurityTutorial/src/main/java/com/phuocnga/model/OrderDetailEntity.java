package com.phuocnga.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "OrderDetail")
public class OrderDetailEntity implements Serializable {
	@EmbeddedId
	OrderDetailId orderDetail;

	@ManyToOne
	@JoinColumn(name = "orderId", insertable = false, updatable = false)
	OrderEntity orderEntity;

	@ManyToOne
	@JoinColumn(name = "productId", insertable = false, updatable = false)
	ProductEntity productEntity;

	@ManyToOne
	@JoinColumn(name = "productToppingId", insertable = false, updatable = false)
	ProductToppingEntity productTopping;

	@ManyToOne
	@JoinColumn(name = "productSizeId", insertable = false, updatable = false)
	SizeEntity productSize;

	@Column(name = "quantity")
	int quantity;

	public OrderDetailEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDetailEntity(OrderDetailId orderDetailId,OrderEntity orderEntity, ProductEntity productEntity, ProductToppingEntity productTopping,
			SizeEntity productSize, int quantity) {
		super();
		this.orderDetail=orderDetailId;
		this.orderEntity = orderEntity;
		this.productEntity = productEntity;
		this.productTopping = productTopping;
		this.productSize = productSize;
		this.quantity = quantity;
	}

	public OrderDetailId getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetailId orderDetail) {
		this.orderDetail = orderDetail;
	}

	public ProductEntity getProductEntity() {
		return productEntity;
	}

	public void setProductEntity(ProductEntity productEntity) {
		this.productEntity = productEntity;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public OrderEntity getOrderEntity() {
		return orderEntity;
	}

	public void setOrderEntity(OrderEntity orderEntity) {
		this.orderEntity = orderEntity;
	}

	public ProductToppingEntity getProductTopping() {
		return productTopping;
	}

	public void setProductTopping(ProductToppingEntity productTopping) {
		this.productTopping = productTopping;
	}

	public SizeEntity getProductSize() {
		return productSize;
	}

	public void setProductSize(SizeEntity productSize) {
		this.productSize = productSize;
	}

}
