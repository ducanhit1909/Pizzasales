package com.phuocnga.model;

import java.beans.Transient;
import java.io.Serializable;
import java.util.Objects;
import java.util.Set;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "Product_Size", schema = "dbo")
public class ProductSizeEntity {
	@EmbeddedId
	private ProductSizeId productSizeId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id", insertable = false, updatable = false)
	private ProductEntity productEntity;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_size", insertable = false, updatable = false)
	private SizeEntity sizeEntity;

	@Column(name = "price")
	private float price;

	public ProductSizeEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductSizeEntity(ProductEntity product, SizeEntity sizeEntity, ProductSizeId sizeId) {
		super();
		this.productEntity = product;
		this.sizeEntity = sizeEntity;
		this.productSizeId = sizeId;
		product.getProductSizes().add(this);
		sizeEntity.getProductSize().add(this);
	}

	public ProductEntity getProduct() {
		return productEntity;
	}

	public void setProduct(ProductEntity product) {
		this.productEntity = product;
	}

	public SizeEntity getSizeEntity() {
		return sizeEntity;
	}

	public void setSizeEntity(SizeEntity sizeEntity) {
		this.sizeEntity = sizeEntity;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;

		if (o == null || getClass() != o.getClass())
			return false;

		ProductSizeEntity that = (ProductSizeEntity) o;
		return Objects.equals(productEntity, that.productEntity) && Objects.equals(sizeEntity, that.sizeEntity);
	}

	@Override
	public int hashCode() {
		return Objects.hash(productEntity, sizeEntity);
	}

	public ProductSizeId getProductSizeId() {
		return productSizeId;
	}

	public void setProductSizeId(ProductSizeId productSizeId) {
		this.productSizeId = productSizeId;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

}
