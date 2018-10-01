package com.brijesh.dao;

import java.util.List;

import com.brijesh.model.Contact;

public interface Contactdao {
	public List<Contact> getContacts(String userId);
	public void addContact(Contact contact);
	public void deleteContact(int contactId);
	public void editContact(String userId,String oldContact,String newContact);
}
