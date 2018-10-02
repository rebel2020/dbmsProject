package com.brijesh.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import javax.validation.constraints.Email;

import com.brijesh.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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
		 String sql = "INSERT INTO USERS(name,username, password,contact,address,DOB,email) VALUES (?,?,?,?,?,?,?)";
		 jdbcTemplate.update(sql,new Object[] {user.getName(),user.getUsername(),user.getPassword(),user.getContact(),user.getAddress(),user.getDOB(),user.getEmail()});
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
				user.setEnabled(rs.getBoolean("enabled"));
				user.setDOB(rs.getString("DOB"));
				user.setEmail(rs.getString("email"));
				return user;
			}
			return null;
			}
		});
	}
	public void switchStatus(String userId) {
		String sql="update USERS set enabled= not enabled where username=\""+userId+"\"";
		jdbcTemplate.update(sql);
		
	}
	public List<User> getAllUsers() {
		String sql="select * from USERS where exists(select * from USERS_ROLES where not role='ROLE_ADMIN' and username = user)";
		List<User> list=jdbcTemplate.query(sql, new BeanPropertyRowMapper(User.class));
		return list;
	}
	public void editProfile(User user,String userId) {
		String sql="update USERS set name=?,address=?,contact=?,DOB=? where username=?";
		System.out.println();
		Object[] object= {user.getName(),user.getAddress(),user.getContact(),user.getDOB(),userId};
		jdbcTemplate.update(sql,object);
		
	}
}