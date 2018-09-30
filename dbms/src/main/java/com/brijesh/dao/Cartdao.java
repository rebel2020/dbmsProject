package com.brijesh.dao;
import java.util.List;

import com.brijesh.model.Cart;
public interface Cartdao {
	public void addToCart(Cart cart);
	public void placeOrder(int cartId);
	public void removeFromCart(int itemId,String userId);
	public List<Cart> getCartItems(String userId);
	public Boolean isIncart(int itemId,String userId);
	public int getPrice(String userId);
}
