package com.brijesh.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.validation.constraints.Email;
import javax.websocket.Decoder.BinaryStream;

import com.brijesh.model.User;
import com.mysql.cj.result.BinaryStreamValueFactory;

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
		String sql = "SELECT * FROM USERS,PROFILE_PIC WHERE username='"+username+"' and PROFILE_PIC.userId=USERS.username";
		final Boolean isEmpty=isProfilePicExists(username)==false;
		if(isEmpty)
			sql="SELECT * FROM USERS WHERE username='"+username+"'";
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
				if(isEmpty==false)
				user.setPhoto(rs.getBlob("photo"));
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
	public void editProfile(User user,String userId)  {
		String sql="update USERS set name=?,address=?,contact=?,DOB=? where username=?";
		System.out.println(); 
		Object[] object= {user.getName(),user.getAddress(),user.getContact(),user.getDOB(),userId};
		jdbcTemplate.update(sql,object);
	}
	public void resetPassword(String userId, String pass) {
		String sql="update USERS set password=\""+pass+"\" where username=\""+userId+"\"";
		jdbcTemplate.update(sql);
	}
	public void changeProfilePic(String userId, InputStream is,byte[] barr) throws ClassNotFoundException, SQLException, IOException {
		Class.forName("com.mysql.jdbc.Driver");
		String sql="update  PROFILE_PIC set photo=? where userId=?";
		if(isProfilePicExists(userId)==false)
			sql="insert into PROFILE_PIC set photo=?,userId=?";
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db1", "root", "Rebel@123");
		PreparedStatement ps=con.prepareStatement(sql);
		System.out.println(barr.length);
		ps.setBinaryStream(1, is,barr.length);
		ps.setString(2, userId);
		ps.executeUpdate();
		is.close();
		ps.close();
		con.close();
		
	}
	public Boolean isProfilePicExists(String username) {
		String sql = "SELECT * FROM PROFILE_PIC WHERE userId='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<User>() {
		
		public User extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				User user = new User();
				return user;
			}
			return null;
			}
		})!=null;
	}
	public void registerEmployee(User user) {
		 String sql = "INSERT INTO USERS(name,username, password,contact,address,DOB,email) VALUES (?,?,?,?,?,?,?)";
		 jdbcTemplate.update(sql,new Object[] {user.getName(),user.getUsername(),user.getPassword(),user.getContact(),user.getAddress(),user.getDOB(),user.getEmail()});
		 sql = "INSERT INTO USERS_ROLES(user,role) VALUES(?,?)";
		 jdbcTemplate.update(sql,new Object[] {user.getUsername(),"ROLE_EMPLOYEE"});

		
	}
	
}