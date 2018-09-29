package com.brijesh;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.brijesh.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.brijesh.dao.Cartdao;
import com.brijesh.dao.Employeedao;
import com.brijesh.dao.Itemdao;
import com.brijesh.dao.Orderdao;
import com.brijesh.model.Cart;
import com.brijesh.model.Employee;
import com.brijesh.model.Item;
import com.brijesh.model.OrderItem;

@Controller
public class OrderController {
	@Autowired
	Orderdao orderdao;
	@Autowired
	Cartdao cartdao;
	@Autowired
	Itemdao itemdao;
	@Autowired
	Employeedao employeedao;
	@RequestMapping("order")
	public String placeOrder(Model model,HttpServletRequest request)
	{
		String userId=request.getUserPrincipal().getName();
		int orderId=orderdao.placeOrder(userId);
		List<Cart> list=cartdao.getCartItems(userId);
		Iterator<Cart> itr=list.iterator();
		while(itr.hasNext())
		{
			Cart cart=itr.next();
//			System.out.println(cart.getItemName()+" "+cart.getQuantity());
			orderdao.addToOrder(userId, orderId, cart.getItemId(),cart.getQuantity(),cart.getItemName());
			int count=itemdao.getItem(cart.getItemId()).getQuantity();
			itemdao.newCount(cart.getItemId(), count-cart.getQuantity());
			cartdao.removeFromCart(cart.getItemId(), userId);
		}
		return "redirect:/orderitems/"+orderId;
//		List<OrderItem> list1=orderdao.getOrderItems(orderId);
//		model.addAttribute("list1",list1);
//		return "order";
	}
	@RequestMapping("admin/orders")
	public String getAllOrders(Model model)
	{
		List<Order> list=orderdao.getAllOrders();
		model.addAttribute("list",list);
		return "orders";
	}
	@RequestMapping("orders")
	public String orders(Model model,HttpServletRequest request)
	{
		String userId=request.getUserPrincipal().getName();
		List<Order> list=orderdao.getOrders(userId);
		model.addAttribute("list",list);
		return "orders";
	}
	@RequestMapping("orderitems/{orderId}")
	public String getOrderItems(Model model,@PathVariable(value="orderId") int orderId,HttpServletRequest request)
	{
		List<OrderItem> list=orderdao.getOrderItems(orderId);
		model.addAttribute("list",list);
		Order order=new Order();
		model.addAttribute("order",order);
		return "order";
	}
	@RequestMapping("admin/orderitems/{orderId}")
	public String getOrderItems(@PathVariable(value="orderId") int orderId,Model model)
	{
		List<OrderItem> list=orderdao.getOrderItems(orderId);
		model.addAttribute("list",list);
		List<Employee> employees=employeedao.getAllEmployee();
		model.addAttribute("employees",employees);
		return "admin/order";
	}
	@RequestMapping(value="admin/assign_employee/{orderId}",method=RequestMethod.POST)
	public String assignEmployee(Model model,HttpServletRequest request,@PathVariable(value="orderId") int orderId)
	{
		int empId=Integer.parseInt(request.getParameter("empId"));
		orderdao.assignEmployee(orderId, empId);
		return "redirect:/admin/orders";
	}
}
