package com.phuocnga.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="OrderMethod")
public class OrderMethodEntity implements Serializable{
	private int id;
	private String orderMethod;
	private Collection<OrderEntity> order;

	public OrderMethodEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Basic
	@Column(name = "orderMethod")
	public String getOrderMethod() {
		return orderMethod;
	}

	public void setOrderMethod(String orderMethod) {
		this.orderMethod = orderMethod;
	}

	@OneToMany(mappedBy = "orderMethod",fetch=FetchType.EAGER)
	public Collection<OrderEntity> getOrder() {
		return order;
	}

	public void setOrder(Collection<OrderEntity> order) {
		this.order = order;
	}

}
