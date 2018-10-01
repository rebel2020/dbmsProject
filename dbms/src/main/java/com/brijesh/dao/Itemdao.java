package com.brijesh.dao;
import java.util.List;

import com.brijesh.model.Item;
public interface Itemdao {
	public Item getItem(int itemId);
	public void deleteItem(int  itemId);
	public void addItem(Item item);
	public List<Item> getAllItems();
	public void newCount(int itemId,int count);
	public Boolean isPresent(int itemId);
}
