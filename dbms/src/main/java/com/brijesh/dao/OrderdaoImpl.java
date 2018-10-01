package com.brijesh.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;
import com.brijesh.model.OrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.brijesh.model.Item;
import com.brijesh.model.Order;

public class OrderdaoImpl implements Orderdao{
	@Autowired
	JdbcTemplate jdbctemplate;
	@Autowired
	DataSource datasource;

	public List<Order> getOrders(String userId) {
		String sql="select * from ORDERS where userID =\""+userId+"\"";
		List<Order> list=jdbctemplate.query(sql, new BeanPropertyRowMapper(Order.class));
		return list;
	}

	public List<OrderItem> getOrderItems(int orderId) {
		String sql="select * from ORDER_ITEM where orderId=\""+orderId+"\"";
		return jdbctemplate.query(sql, new BeanPropertyRowMapper(OrderItem.class));
	}

	public int placeOrder(String userId,int amount,int netAmount,int offerId) {
		String sql="select max(orderId) from ORDERS";
		Order maxOrder=jdbctemplate.query(sql, new ResultSetExtractor<Order>() {
			public Order extractData(ResultSet rs) throws SQLException
			{
				if(rs.next())
				{
					Order order=new Order();
					order.setOrderId(rs.getInt("max(orderId)"));
					return order;
				}
				return null;
			}
		}
		);
		int x;
		if(maxOrder==null)
			x=0;
		else x=maxOrder.getOrderId();
		x+=1;
		String sql1="insert into ORDERS set orderId=?,userId=?,amount=?,netAmount=?,offerId=?";
		Object[] object= {x,userId,amount,netAmount,offerId};
		jdbctemplate.update(sql1,object);
		return x;
	}

	public void addToOrder(String userId, int orderId, int itemId,int quantity,String itemName) {
		String sql="insert into ORDER_ITEM set orderId=?,itemId=?,userId=?,quantity=?,itemName=?"; 
		Object[] object= {orderId,itemId,userId,quantity,itemName};
		jdbctemplate.update(sql,object);
	}

	public List<Order> getAllOrders() {
		String sql="select * from ORDERS";
		List<Order> list=jdbctemplate.query(sql, new BeanPropertyRowMapper(Order.class));
		return list;
	}

	public void assignEmployee(int orderId, int empId) {
		String sql="update ORDERS set empId="+empId+" where orderId="+orderId;
		jdbctemplate.update(sql);
	}

	public Order getOrder(int orderId) {
		String sql="select * from ORDERS where orderId="+orderId;
		return jdbctemplate.query(sql, new ResultSetExtractor<Order>() {
			public Order extractData(ResultSet rs) throws SQLException
			{
				if(rs.next())
				{
					Order order = new Order();
					order.setAmount(rs.getInt("amount"));
					order.setNetAmount(rs.getInt("netAmount"));
					order.setEmpId(rs.getInt("empId"));
					order.setOrderId(rs.getInt("orderId"));
					return order;
				}
				return null;
			}
		});
	}
}
