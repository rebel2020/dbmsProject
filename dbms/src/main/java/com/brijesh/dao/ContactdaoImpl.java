package com.brijesh.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.brijesh.model.Contact;

public class ContactdaoImpl implements Contactdao{
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<Contact> getContacts(String userId) {
		String sql="select * from CONTACT where userId=\""+userId+"\"";
		List<Contact> list=jdbcTemplate.query(sql, new BeanPropertyRowMapper(Contact.class));
		return list;
				
	}

	public void addContact(Contact contact) {
		String sql="insert into CONTACT set userId=?,contact=?";
		Object[] object= {contact.getUserId(),contact.getContact()};
		jdbcTemplate.update(sql,object);
	}

	public void deleteContact(int contactId) {
		String sql="delete from CONTACT where  contactId=?";
//		System.out.println(contact+" "+userId);
		Object[] object= {contactId};
		jdbcTemplate.update(sql,object);
	}

	public void editContact(String userId, String oldContact, String newContact) {
		String sql="update CONTACT set contact=? where userId=? and contact=?";
		Object[] object= {newContact,userId,oldContact};
		jdbcTemplate.update(sql,object);
	}

}
