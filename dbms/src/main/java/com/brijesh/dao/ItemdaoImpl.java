package com.brijesh.dao;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import com.brijesh.model.Item;
import com.mysql.jdbc.Driver;

import org.hibernate.validator.internal.engine.messageinterpolation.InterpolationTerm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.ui.Model;

import com.brijesh.dao.Itemdao;
import com.brijesh.model.Item;

public class ItemdaoImpl implements Itemdao{
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	public Item getItem(int itemId) {
		String sql="select * from ITEMS natural join ITEM_IMAGE where itemId=\""+itemId+"\"";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Item>() {
			public Item extractData(ResultSet rs) throws SQLException
			{
				if(rs.next())
				{
					Item item=new Item();
					item.setItemId(rs.getInt("itemId"));
					item.setName(rs.getString("name"));
					item.setDescription(rs.getString("description"));
					item.setQuantity(rs.getInt("quantity"));
					item.setPrice(rs.getInt("price"));
					item.setWeight(rs.getInt("weight"));
					item.setPkgDate(rs.getString("pkgDate"));
					item.setPhoto(rs.getBlob("photo"));
					return item;
				}
				return null;
			}
			
		}
		);
	}
	
	public void deleteItem(int itemId) {
		String sql="update ITEMS set isAvailable= not isAvailable,quantity=0  where itemId=\""+itemId+"\"";
		jdbcTemplate.update(sql);
		
		
	}
	public int getMaxItemId()
	{
		String sql="select max(itemId) from ITEMS";
		Item item= jdbcTemplate.query(sql, new ResultSetExtractor<Item>()
		{
			public Item extractData(ResultSet rs) throws SQLException
			{
				if(rs.next())
				{
					Item item=new Item();
					item.setItemId(rs.getInt("max(itemId)"));
					return item;
				}
				return null;
			}
		});
		if(item!=null)
			return item.getItemId();
		return 1;
	}
	public void addItem(Item item,InputStream is,byte[] barr) throws ClassNotFoundException, SQLException {
		String sql="insert into ITEMS set name=?,description=?,quantity=?,price=?,weight=?,pkgDate=?";
		Object[] object= {item.getName(),item.getDescription(),item.getQuantity(),item.getPrice(),item.getWeight(),item.getPkgDate()};
		jdbcTemplate.update(sql,object);
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db1", "root", "Rebel@123");
		PreparedStatement ps=con.prepareStatement("insert into ITEM_IMAGE set photo=?, itemId="+getMaxItemId());
		ps.setBinaryStream(1, is, barr.length);
		ps.executeUpdate();
	}
	public List<Item> getAllItems() {
		List<Item> list;
		String sql="select * from ITEMS,ITEM_IMAGE where isAvailable =true and ITEMS.itemId=ITEM_IMAGE.itemId";
		list=(List<Item>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Item>(Item.class));
		return list;
	}
	public void newCount(int itemId, int count) {
		String sql="update ITEMS set quantity=\""+count+"\" where itemId=\""+itemId+"\"";
		jdbcTemplate.update(sql);
	}
	public Boolean isPresent(int itemId) {
		String sql="select * from ITEMS where isAvailable=true and itemId=\""+itemId+"\"";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Item>() {
			public Item extractData(ResultSet rs) throws SQLException
			{
				if(rs.next())
				{
					Item item=new Item();
					item.setItemId(rs.getInt("itemId"));
					return item;
				}
				return null;
			}
			
		}
		)!=null;
	}
	
}
