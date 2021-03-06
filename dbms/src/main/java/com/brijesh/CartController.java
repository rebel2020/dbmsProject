package com.brijesh;

import com.brijesh.model.Cart;
import com.brijesh.model.Item;
import com.brijesh.model.Offer;

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
import com.brijesh.dao.Offerdao;
import com.brijesh.dao.Userdao;
@Controller
public class CartController {
	@Autowired
	Cartdao cartdao;
	@Autowired
	Offerdao offerdao;
	@Autowired
	Itemdao itemdao;
	@Autowired
	Userdao userdao;
	
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
		cart.setCartQuantity(Integer.parseInt(request.getParameter("quantity")));
		cart.setName(itemdao.getItem(itemId).getName());
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
		model.addAttribute("price",cartdao.getPrice(userId));
		model.addAttribute("net_price",cartdao.getPrice(userId));
		List<Offer> offers=offerdao.getOffers();
		model.addAttribute("offers",offers);
		model.addAttribute("offerId", 0);
		model.addAttribute("address",userdao.getUser(userId).getAddress());
		return "Cart";
	}
//	@RequestMapping("cart/{offerId}")
	public String viewOfferCart(Model model,HttpServletRequest request,int offerId)
	{
		Principal principal=request.getUserPrincipal();
		String userId=principal.getName();
		List<Cart> list=cartdao.getCartItems(userId);
		model.addAttribute("list",list);
		int price=cartdao.getPrice(userId);
		model.addAttribute("price",price);
		model.addAttribute("net_price",price-offerdao.getOffer(offerId).getPercentageOff()*price/100);
		List<Offer> offers=offerdao.getOffers();
		model.addAttribute("offers",offers);
		model.addAttribute("offerId", offerId);
		model.addAttribute("address",userdao.getUser(userId).getAddress());
		System.out.println(offerId);
		return "Cart";
	}
	@RequestMapping("apply_offer")
	public String applyOffer(Model model,HttpServletRequest request)
	{
		int offerId=Integer.parseInt(request.getParameter("offerId"));
		String userId=request.getUserPrincipal().getName();
		model.addAttribute("offerId",offerId);
		return viewOfferCart(model,request,offerId); 
//		return "redirect:/cart";
	}
}
