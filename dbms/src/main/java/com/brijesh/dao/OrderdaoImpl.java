package com.brijesh.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import com.brijesh.model.OrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.transaction.annotation.Transactional;

import com.brijesh.model.Order;
import com.brijesh.model.UserRole;

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
		String sql="select * from ITEMS,ORDER_ITEM,ITEM_IMAGE where orderId="+orderId+" and ITEMS.itemId=ORDER_ITEM.itemId and ITEMS.itemId=ITEM_IMAGE.itemId";
		return jdbctemplate.query(sql, new BeanPropertyRowMapper(OrderItem.class));
	}
	public int placeOrder(String userId,int amount,int netAmount,int offerId,String address,String date) {
		String s="insert into temp set name=10";
		jdbctemplate.update(s);
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
		String sql1="insert into ORDERS set orderId=?,userId=?,amount=?,netAmount=?,offerId=?,address=?,date=?";
		Object[] object= {x,userId,amount,netAmount,offerId,address,date};
		jdbctemplate.update(sql1,object);
		return x;
	}

	public void addToOrder(int orderId, int itemId,int quantity) {
		String sql="insert into ORDER_ITEM set orderId=?,itemId=?,quantity=?"; 
		Object[] object= {orderId,itemId,quantity};
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
	public List<Order> getAssignedOrders(int empId) {
		String sql="select * from ORDERS where empId="+empId;
		return jdbctemplate.query(sql, new BeanPropertyRowMapper(Order.class));
	}

	public void orderConfirmation(String userId, int orderId) {
		String sql="select * from USERS_ROLES,USERS where USERS.username=USERS_ROLES.user and USERS.username='"+userId+"'";
		String auth=jdbctemplate.query(sql, new ResultSetExtractor<UserRole>(){
			public UserRole extractData(ResultSet rs) throws SQLException
			{
				if(rs.next())
				{
					UserRole userRole=new UserRole();
					userRole.setRole(rs.getString("role"));
					return userRole;
				}
				return null;
			}
		}).getRole();
		int x=0;
		if(auth.equals("ROLE_EMPLOYEE"))
			x=10;
		else x=1;
		String s="update ORDERS set status=status+"+x+" where orderId="+orderId;
		jdbctemplate.update(s);
	}
	public List<Order> employeeUndeliveredOrders(int empId) {
		String sql="select * from ORDERS where empId="+empId+" and status/10 = 0";
		return jdbctemplate.query(sql, new BeanPropertyRowMapper(Order.class));
	}
}
