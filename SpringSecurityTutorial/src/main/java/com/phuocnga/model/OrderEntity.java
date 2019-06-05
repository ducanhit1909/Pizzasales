package com.phuocnga.model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "[Order]")
public class OrderEntity implements Serializable {
	private int id;
	private LocalDateTime dateOrder;
	private int totalQuantity;
	private double totalPrice;
	private OrderMethodEntity orderMethod;
	private Collection<OrderDetailEntity> orderDetail;
	private boolean status;
	private UserEntity userEntity;

	public OrderEntity() {
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
	@Column(name = "dateOrdered")
	public LocalDateTime getDateOrder() {
		return dateOrder;
	}

	public void setDateOrder(LocalDateTime dateOrder) {
		this.dateOrder = dateOrder;
	}

	@Basic
	@Column(name = "totalQuantity")
	public int getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	@Basic
	@Column(name = "totalPrice")
	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@ManyToOne
	@JoinColumn(name = "orderMethod")
	public OrderMethodEntity getOrderMethod() {
		return orderMethod;
	}

	public void setOrderMethod(OrderMethodEntity orderMethod) {
		this.orderMethod = orderMethod;
	}

	@Basic
	@Column(name = "status")
	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@OneToMany(mappedBy = "orderEntity", cascade = CascadeType.ALL)
	public Collection<OrderDetailEntity> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(Collection<OrderDetailEntity> orderDetail) {
		this.orderDetail = orderDetail;
	}

	@JoinColumn(name="userId")
	@ManyToOne(fetch = FetchType.EAGER)
	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

}
