package com.brijesh.model;

import java.sql.Blob;

public class OrderItem {
	int OrderId;
	int itemId;
	String name;
	int quantity;
	String pkgDate;
	String description;
	Blob photo;
	String forImage;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Blob getPhoto() {
		return photo;
	}
	public void setPhoto(Blob photo) {
		this.photo = photo;
	}
	public String getForImage() {
		return forImage;
	}
	public void setForImage(String forImage) {
		this.forImage = forImage;
	}
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
