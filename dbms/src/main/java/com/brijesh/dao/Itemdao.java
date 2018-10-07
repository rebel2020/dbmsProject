package com.brijesh.dao;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import com.brijesh.model.Item;
public interface Itemdao {
	public Item getItem(int itemId);
	public void deleteItem(int  itemId);
	public void addItem(Item item,InputStream is,byte[] barr) throws ClassNotFoundException, SQLException;
	public List<Item> getAllItems();
	public void newCount(int itemId,int count);
	public Boolean isPresent(int itemId);
}
