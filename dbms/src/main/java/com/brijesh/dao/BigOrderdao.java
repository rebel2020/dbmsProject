package com.brijesh.dao;

import java.util.List;


import com.brijesh.model.BigOrder;

public interface BigOrderdao {
	public BigOrder getOrder(int orderId);
	public void enterPrice(int orderId,int price);
	public void confirmOrder(int orderId);
	public void fillDetails(String userID,BigOrder order);
	public void addOrder(BigOrder order);
	public List<BigOrder> getAllOrders();
	public List<BigOrder> getUserOrders(String userId);
	public void userDeliveryConfirm(int orderId);
	public void adminDeliveryConfirm(int orderId);
	
}
