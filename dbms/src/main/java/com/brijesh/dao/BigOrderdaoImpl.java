package com.brijesh.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.brijesh.model.BigOrder;
import com.brijesh.model.Order;
import com.mysql.cj.protocol.Resultset;

public class BigOrderdaoImpl implements BigOrderdao{
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired 
	DataSource datasource;
	public void confirmOrder(int orderId) {
		String sql="update BIGORDER set isConfirmed=1 where orderId="+orderId;
		jdbcTemplate.update(sql);
	}

	public void fillDetails(String userID, BigOrder order) {
		String sql="update BIGORDER set panNumber=?,adharNumber=?,bulkQuantity=? where orderId="+order.getOrderId();
		Object[] object= {order.getPanNumber(),order.getAdharNumber(),order.getBulkQuantity()};
		jdbcTemplate.update(sql,object);
	}

	public void addOrder(BigOrder order) {
		String sql="insert into BIGORDER set panNumber=?,adharNumber=?,userId=?,bulkQuantity=?,address=?";
		Object[] object= {order.getPanNumber(),order.getAdharNumber(),order.getUserId(),order.getBulkQuantity(),order.getAddress()};
		jdbcTemplate.update(sql,object);
		
	}

	public List<BigOrder> getAllOrders() {
		String sql="select * from BIGORDER join USERS where USERS.username=BIGORDER.userId";
		List<BigOrder> list=jdbcTemplate.query(sql,new BeanPropertyRowMapper(BigOrder.class));
		return list;
	}

	public List<BigOrder> getUserOrders(String userId) {
		String sql="select * from BIGORDER, USERS where USERS.username='"+userId+"' and USERS.username=BIGORDER.userId";
		List<BigOrder> list=jdbcTemplate.query(sql,new BeanPropertyRowMapper(BigOrder.class));
		return list;
	}

	public BigOrder getOrder(int orderId) {
		String sql="select * from BIGORDER where orderId="+orderId;
		BigOrder order=jdbcTemplate.query(sql, new ResultSetExtractor<BigOrder>() {
			public BigOrder extractData(ResultSet rs) throws SQLException
			{
				if(rs.next())
				{
					BigOrder order=new BigOrder();
					order.setAdharNumber(rs.getString("adharNumber"));
					order.setPanNumber(rs.getString("panNumber"));
					order.setPrice(rs.getInt("price"));
					order.setIsConfirmed(rs.getBoolean("isConfirmed"));
					order.setDate(rs.getString("date"));
					order.setAmount(rs.getInt("amount"));
					order.setBulkQuantity(rs.getInt("bulkQuantity"));
					order.setStatus(rs.getInt("status"));
					order.setOrderId(rs.getInt("orderId"));
					order.setAddress(rs.getString("address"));
					return order;
				}
				return null;
			}
		});
		return order;
	}

	public void enterPrice(int orderId, int price) {
		String sql="update BIGORDER set price="+price+" where orderId="+orderId;
		jdbcTemplate.update(sql);
		
	}
	public void userDeliveryConfirm(int orderId) {
		int x=0;
		int status=getOrder(orderId).getStatus();
		if(status==10||status==0)
			x=1;
		System.out.println(x);
		String sql="update BIGORDER set status=status+"+x+" where orderId="+orderId;
		jdbcTemplate.update(sql);
	}
	public void adminDeliveryConfirm(int orderId) {
		int x=0;
		int status=getOrder(orderId).getStatus();
		if(status==1||status==0)
			x=10;
		String sql="update BIGORDER set status=status+"+x+" where orderId="+orderId;
		jdbcTemplate.update(sql);
	}
}
