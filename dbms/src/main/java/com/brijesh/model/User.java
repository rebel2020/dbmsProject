package com.brijesh.model;

import org.hibernate.validator.constraints.NotEmpty;

@SuppressWarnings("deprecation")
public class User{
	@NotEmpty(message="required")
	private String username;
	@NotEmpty(message="required")
	private String password;
	@NotEmpty(message="required")
	private String mpassword;
	String contact;
	String address;
	String name;
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User() {
		
	}
	
	public User(String uname,String pass,String mpass) {
		this.username=uname;
		this.password=pass;
		this.mpassword=mpass;
	}
	public User(String uname,String pass) {
		this.username=uname;
		this.password=pass;
		
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMpassword() {
		return mpassword;
	}

	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}