package com.phuocnga.model;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ProductSizeId implements Serializable {
	@Column(name = "product_id")
	private int productId;

	@Column(name = "product_size")
	private int productSize;

	public ProductSizeId() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductSizeId(int productId, int productSize) {
		super();
		this.productId = productId;
		this.productSize = productSize;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;

		if (o == null || getClass() != o.getClass())
			return false;

		ProductSizeId that = (ProductSizeId) o;
		return Objects.equals(productId, that.productId) && Objects.equals(productSize, that.productSize);
	}

	@Override
	public int hashCode() {
		return Objects.hash(productId, productSize);
	}
}
