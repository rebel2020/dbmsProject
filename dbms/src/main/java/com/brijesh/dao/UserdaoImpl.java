package com.brijesh.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import com.brijesh.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

public class UserdaoImpl implements Userdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public UserdaoImpl() {
		
	}
	public UserdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(User user) {
		 String sql = "INSERT INTO USERS(name,username, password,contact,address) VALUES (?,?,?,?,?)";
		 jdbcTemplate.update(sql,new Object[] {user.getName(),user.getUsername(),user.getPassword(),user.getContact(),user.getAddress()});
		 sql = "INSERT INTO USERS_ROLES(user,role) VALUES(?,?)";
		 jdbcTemplate.update(sql,new Object[] {user.getUsername(),"ROLE_USER"});
		 
		 //System.out.println("EROOR");
	}
	public void delete(String username) {
		String sql = "DELETE FROM users WHERE username=?";
		jdbcTemplate.update(sql,username);
	}
	public User getUser(String username) {
		String sql = "SELECT * FROM USERS WHERE username='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<User>() {
		
		public User extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				User user = new User();
				user.setName(rs.getString("name"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setAddress(rs.getString("address"));
				user.setContact(rs.getString("contact"));
				return user;
			}
			return null;
		}
	});
}
}