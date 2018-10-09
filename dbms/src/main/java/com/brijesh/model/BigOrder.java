package com.brijesh.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

public class BigOrder {
	String userId;
	int orderId;
	@Min(1000)
	int bulkQuantity;
	@Pattern(regexp="[A-Z]{3}[ABCFGHLJPT][A-Z][0-9]{4}[A-Z]")
	String panNumber;
	String adharNumber;
	Boolean isConfirmed;
	int status;
	String date;	
	int price;
	int amount;
	String address;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int i) {
		this.orderId = i;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getBulkQuantity() {
		return bulkQuantity;
	}
	public void setBulkQuantity(int bulkQuantity) {
		this.bulkQuantity = bulkQuantity;
	}
	public String getPanNumber() {
		return panNumber;
	}
	public void setPanNumber(String panNumber) {
		this.panNumber = panNumber;
	}
	public String getAdharNumber() {
		return adharNumber;
	}
	public void setAdharNumber(String addharNumber) {
		this.adharNumber = addharNumber;
	}
	public Boolean getIsConfirmed() {
		return isConfirmed;
	}
	public void setIsConfirmed(Boolean isConfirmed) {
		this.isConfirmed = isConfirmed;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
