package com.phuocnga.model;

import java.util.List;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NaturalId;
import org.hibernate.annotations.NaturalIdCache;

@Entity
@Table(name = "Size", schema = "dbo")
public class SizeEntity {
	private int id;
	private String size;
	private List<ProductSizeEntity> productSizes;
	private List<OrderDetailEntity>orderDetail;
	public SizeEntity() {
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

	@Column(name = "size")
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	@OneToMany(mappedBy = "sizeEntity")
	public List<ProductSizeEntity> getProductSize() {
		return productSizes;
	}

	public void setProductSize(List<ProductSizeEntity> productSize) {
		this.productSizes = productSize;
	}
	@OneToMany(mappedBy="productSize")
	public List<OrderDetailEntity> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(List<OrderDetailEntity> orderDetail) {
		this.orderDetail = orderDetail;
	}
	
}
