package com.brijesh.dao;

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
	public void editProfile(User user,String userId);
	public void resetPassword(String userId,String pass);
}