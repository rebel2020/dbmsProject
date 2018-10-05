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
	public int placeOrder(String userId,int amount,int netAmount,int offerId,String address,String date);
	public void addToOrder(int orderId,int itemId,int quantity);
	public List<Order> getAllOrders();
	public void assignEmployee(int orderId,int empId);
	public Order getOrder(int orderId);
	public List<Order> getAssignedOrders(int empId);
	public void orderConfirmation(String userId,int orderId);
	public List<Order> employeeUndeliveredOrders(int empId);
}
