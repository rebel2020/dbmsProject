package com.brijesh.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.brijesh.dao.Cartdao;
import com.brijesh.model.Cart;
import com.brijesh.model.Item;
public class CartdaoImpl implements Cartdao{
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	DataSource datasource;
	public void addToCart(Cart cart) {
		String sql="insert into CART set userId=?,itemId=?,itemName=?,quantity=?";
		Object[] object= {cart.getUserId(),cart.getItemId(),cart.getItemName(),cart.getQuantity()};
		jdbcTemplate.update(sql,object);
	}
	
	public void placeOrder(int cartId) {
		
		
	}

	public void removeFromCart(int itemId,String userId) {
		String sql="delete from CART where itemId=? and userId=?";
		Object[] object= {itemId,userId};
		jdbcTemplate.update(sql,object);
	}
	public List<Cart> getCartItems(String userId)
	{
		String sql="select * from CART  where userId=\""+userId+"\"";
		List<Cart> list=(List<Cart>)jdbcTemplate.query(sql, new BeanPropertyRowMapper(Cart.class));
		return list;
	}

	public Boolean isIncart(int itemId,String userId) {
		String sql="select * from CART where itemId=\""+itemId+"\" and userId=\""+userId+"\"";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Cart>() {
			public Cart extractData(ResultSet rs) throws SQLException
			{
				if(rs.next())
				{
					Cart cart=new Cart();
					cart.setItemId(rs.getInt("itemId"));
					return cart;
				}
				return null;
			}
		}		
		)!=null;
	}
}
