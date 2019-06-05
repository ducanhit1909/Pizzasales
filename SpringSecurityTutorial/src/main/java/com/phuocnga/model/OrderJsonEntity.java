package com.phuocnga.model;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.NumberFormat;

public class OrderJsonEntity implements Serializable {
	boolean isAccess;
	String productName;
	Long quantity;
	String totalPriceOfOrder;

	public OrderJsonEntity() {
		super();
	}

	public OrderJsonEntity(boolean isAccess, String productName, Long totalQuantityOfOrder) {
		super();
		this.isAccess = isAccess;
		this.productName = productName;
		this.quantity = totalQuantityOfOrder;
	}

	public boolean isAccess() {
		return isAccess;
	}

	public void setAccess(boolean isAccess) {
		this.isAccess = isAccess;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public String getTotalPriceOfOrder() {
		return totalPriceOfOrder;
	}

	public void setTotalPriceOfOrder(Double totalPriceOfOrder) {
		NumberFormat decimalFormat = new DecimalFormat("###,###,###");
		String totalPrice = decimalFormat.format(totalPriceOfOrder) + " VND";
		this.totalPriceOfOrder = totalPrice;
	}

}
