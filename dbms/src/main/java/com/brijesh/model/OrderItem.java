package com.brijesh.model;

public class OrderItem {
	int OrderId;
	int itemId;
	String name;
	int quantity;
	String pkgDate;
	String description;
	public String getPkgDate() {
		return pkgDate;
	}
	public void setPkgDate(String pkgDate) {
		this.pkgDate = pkgDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getname() {
		return name;
	}
	public void setname(String itemName) {
		this.name = itemName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
