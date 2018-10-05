package com.brijesh.model;

import java.sql.Date;

public class Order {
		int orderId;
		String userId;
		String date;
		int Price;
		String address;
		int empId;
		int status;
		int amount;
		int netAmount;
		int offerId;
		String offerName;
		String deliveryDate;
		public String getDeliveryDate() {
			return deliveryDate;
		}
		public void setDeliveryDate(String deliveryDate) {
			this.deliveryDate = deliveryDate;
		}
		public String getOfferName() {
			return offerName;
		}
		public void setOfferName(String offerName) {
			this.offerName = offerName;
		}
		public int getNetAmount() {
			return netAmount;
		}
		public void setNetAmount(int netAmount) {
			this.netAmount = netAmount;
		}
		public int getOrderId() {
			return orderId;
		}
		public void setOrderId(int orderId) {
			this.orderId = orderId;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public int getPrice() {
			return Price;
		}
		public void setPrice(int price) {
			Price = price;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public int getEmpId() {
			return empId;
		}
		public void setEmpId(int empId) {
			this.empId = empId;
		}
		public int getStatus()
		{
			return this.status;
		}
		public void setStatus(int status)
		{
			this.status=status;
		}
		public int getAmount() {
			return amount;
		}
		public void setAmount(int amount) {
			this.amount = amount;
		}
		public int getOfferId() {
			return offerId;
		}
		public void setOfferId(int offerId) {
			this.offerId = offerId;
		}
		
}
