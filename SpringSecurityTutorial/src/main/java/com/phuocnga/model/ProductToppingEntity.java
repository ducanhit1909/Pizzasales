package com.phuocnga.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Topping", schema = "dbo")
public class ProductToppingEntity implements Serializable {
	int id;
	String toppingType;
	List<ProductEntity> productEntity;
	List<OrderDetailEntity> orderDetail;

	public ProductToppingEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Basic
	@Column(name = "type")
	public String getToppingType() {
		return toppingType;
	}

	public void setToppingType(String toppingType) {
		this.toppingType = toppingType;
	}

	@ManyToMany(mappedBy = "productToppings", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	public List<ProductEntity> getProductEntity() {
		return productEntity;
	}

	public void setProductEntity(List<ProductEntity> productEntity) {
		this.productEntity = productEntity;
	}

	@OneToMany(mappedBy = "productTopping")
	public List<OrderDetailEntity> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(List<OrderDetailEntity> orderDetail) {
		this.orderDetail = orderDetail;
	}

}
