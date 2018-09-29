package com.brijesh;

import com.brijesh.model.Cart;
import com.brijesh.model.Item;

import java.util.List;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.brijesh.dao.Cartdao;
import com.brijesh.dao.CartdaoImpl;
import com.brijesh.dao.Itemdao;
@Controller
public class CartController {
	@Autowired
	Cartdao cartdao;
	@Autowired
	Itemdao itemdao;
	@RequestMapping("addtocart/{itemId}")
	public String addToCart(@PathVariable(value="itemId") int itemId,HttpServletRequest request,Model model)
	{
		
		Principal principal=request.getUserPrincipal();
		String userId=principal.getName();
		if(cartdao.isIncart(itemId, userId))
			return "redirect:/cart";
		Cart cart=new Cart();
		cart.setItemId(itemId);
		cart.setUserId(userId);
//		System.out.println(Integer.parseInt(request.getParameter("quantity")));
		cart.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		cart.setItemName(itemdao.getItem(itemId).getName());
		cartdao.addToCart(cart);
		return "redirect:/cart";
	}
	@RequestMapping("removefromcart/{itemId}")
	public String removeFromCart(@PathVariable(value="itemId") int itemId,HttpServletRequest request,Model model)
	{
		Principal principal=request.getUserPrincipal();
		String userId=principal.getName();
		cartdao.removeFromCart(itemId, userId);
		return "redirect:/cart";
	}
	@RequestMapping("cart")
	public String viewCart(Model model,HttpServletRequest request)
	{
		Principal principal=request.getUserPrincipal();
		String userId=principal.getName();
		List<Cart> list=cartdao.getCartItems(userId);
		model.addAttribute("list",list);
		return "Cart";
	}
//	@RequestMapping("isincart/{itemId}")
}
