package com.brijesh.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.brijesh.model.User;

public interface Userdao{
	@Autowired
	public void saveOrUpdate(User user);
	public void delete(String username);
	public User getUser(String username);
	public void switchStatus(String userId);
	public List<User> getAllUsers();
	public void editProfile(User user,String userId) throws FileNotFoundException, IOException, ClassNotFoundException, SQLException;
	public void resetPassword(String userId,String pass);
	public void changeProfilePic(String userId,InputStream is,byte[] barr) throws ClassNotFoundException, SQLException, IOException;
	public void registerEmployee(User user);
}    