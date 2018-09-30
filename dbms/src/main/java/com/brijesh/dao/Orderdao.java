package com.brijesh.dao;

import com.brijesh.model.Item;

import java.util.List;

import com.brijesh.model.Employee;
import com.brijesh.model.User;
import com.brijesh.model.Order;
import com.brijesh.model.OrderItem;
public interface Orderdao {
	public List<Order> getOrders(String userId);
	public List<OrderItem> getOrderItems(int orderId);
	public int placeOrder(String userId,int amount);
	public void addToOrder(String userId,int orderId,int itemId,int quantity,String itemName);
	public List<Order> getAllOrders();
	public void assignEmployee(int orderId,int empId);
	
}
