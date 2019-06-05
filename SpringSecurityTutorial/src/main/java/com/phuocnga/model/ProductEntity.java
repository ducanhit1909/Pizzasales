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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "Products", schema = "dbo")
public class ProductEntity implements Serializable {
	private int id;

	private String name;

	private String description;

	private ProductCategoryEntity productCategory;

	private List<ProductSizeEntity> productSizes;

	private List<ProductToppingEntity> productToppings;

	private List<OrderDetailEntity> orderDetail;

	private String image;

	public ProductEntity(int id, String name, double price) {
		super();
		this.id = id;
		this.name = name;
	}

	public ProductEntity() {
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
	@Column(name = "name", nullable = true)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Basic
	@Column(name = "description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToOne
	@JoinColumn(name = "pizzaCategory", nullable = false)
	public ProductCategoryEntity getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategoryEntity productCategory) {
		this.productCategory = productCategory;
	}

	@OneToMany(mappedBy = "productEntity",fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	public List<ProductSizeEntity> getProductSizes() {
		return productSizes;
	}

	public void setProductSizes(List<ProductSizeEntity> productSizes) {
		this.productSizes = productSizes;
	}

	@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinTable(name = "Product_Topping", joinColumns = @JoinColumn(name = "product_id"), inverseJoinColumns = @JoinColumn(name = "product_topping"))
	public List<ProductToppingEntity> getProductToppings() {
		return productToppings;
	}

	public void setProductToppings(List<ProductToppingEntity> productTopping) {
		this.productToppings = productTopping;
	}

	@OneToMany(mappedBy = "productEntity")
	public List<OrderDetailEntity> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(List<OrderDetailEntity> orderDetail) {
		this.orderDetail = orderDetail;
	}

	@Basic
	@Column(name = "image")
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
