package com.brijesh;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.brijesh.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
/*	@Transactional
	@RequestMapping("order")
	public String placeOrder(Model model,HttpServletRequest request)
	{
		String userId=request.getUserPrincipal().getName();
		int price=cartdao.getPrice(userId);
		String date=LocalDate.now().toString();
		String address=request.getParameter("address");
		int orderId=orderdao.placeOrder(userId,price,price,0,address,date);
		List<Cart> list=cartdao.getCartItems(userId);
		Iterator<Cart> itr=list.iterator();
		if(!itr.hasNext())
		{
			return "redirect:/cart";
		}
		while(itr.hasNext())
		{
			Cart cart=itr.next();
			if(cart.getCartQuantity()>cart.getQuantity())
				continue;
			orderdao.addToOrder(orderId, cart.getItemId(),cart.getCartQuantity());
			itemdao.newCount(cart.getItemId(), cart.getQuantity()-cart.getCartQuantity());
			cartdao.removeFromCart(cart.getItemId(), userId);
		}
		return "redirect:/orderitems/"+orderId;
	}*/
	@Transactional
	@RequestMapping("order/{net_price}")
	public String placeOfferOrder(Model model,HttpServletRequest request,@PathVariable(value="net_price") int net_price)
	{
		String userId=request.getUserPrincipal().getName();
		String date=LocalDate.now().toString();
		String address=request.getParameter("address");
		int orderId=orderdao.placeOrder(userId,cartdao.getPrice(userId),net_price,Integer.parseInt(request.getParameter("offerId")),address,date);
		List<Cart> list=cartdao.getCartItems(userId);
		Iterator<Cart> itr=list.iterator();
		while(itr.hasNext())
		{
			Cart cart=itr.next();
			if(cart.getQuantity()<cart.getCartQuantity())
				continue;
			orderdao.addToOrder(orderId, cart.getItemId(),cart.getCartQuantity());
			itemdao.newCount(cart.getItemId(), cart.getQuantity()-cart.getCartQuantity());
			cartdao.removeFromCart(cart.getItemId(), userId);
		}
		return "redirect:/orderitems/"+orderId;
	}
	@RequestMapping("admin/orders")
	public String getAllOrders(Model model)
	{
		List<Order> list=orderdao.getAllOrders();
		model.addAttribute("list",list);
		List<Employee> list1=employeedao.getAllEmployee();
		model.addAttribute("list1",list1);
		return "admin/orders";
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
	public String getOrderItems(Model model,@PathVariable(value="orderId") int orderId,HttpServletRequest request) throws SQLException
	{
		List<OrderItem> list=orderdao.getOrderItems(orderId);
		Iterator<OrderItem> itr=list.iterator();
		while(itr.hasNext())
		{
			OrderItem item=itr.next();
			item.setForImage(Base64.getEncoder().encodeToString(item.getPhoto().getBytes(1, (int) item.getPhoto().length())));
		}
		model.addAttribute("list",list);
		model.addAttribute("order",orderdao.getOrder(orderId));
		return "order";
	}
	@RequestMapping("admin/orderitems/{orderId}")
	public String getOrderItems(@PathVariable(value="orderId") int orderId,Model model) throws SQLException
	{
		List<OrderItem> list=orderdao.getOrderItems(orderId);
		Iterator<OrderItem> itr=list.iterator();
		while(itr.hasNext())
		{
			OrderItem item=itr.next();
			item.setForImage(Base64.getEncoder().encodeToString(item.getPhoto().getBytes(1, (int) item.getPhoto().length())));
		}
		model.addAttribute("list",list);
		return "admin/order";
	}
	@RequestMapping(value="admin/assign_employee/{orderId}",method=RequestMethod.POST)
	public String assignEmployee(Model model,HttpServletRequest request,@PathVariable(value="orderId") int orderId)
	{
		int empId=Integer.parseInt(request.getParameter("empId"));
		orderdao.assignEmployee(orderId, empId);
		return "redirect:/admin/orders";
	}
	@RequestMapping("admin/assigned_orders/{empId}")
	public String getAssignedOrders(@PathVariable(value="empId") int empId,Model model)
	{
		model.addAttribute("list",orderdao.getAssignedOrders(empId));
		model.addAttribute("employee",employeedao.getEmployee(empId));
		return "admin/assignedOrders"; 
	}
	@RequestMapping("user/deliver/{orderId}")
	public String userDelivered(Model model,HttpServletRequest request,@PathVariable(value="orderId") int orderId)
	{
		orderdao.orderConfirmation(request.getUserPrincipal().getName(), orderId);
		return "redirect:/orders";
	}
	@RequestMapping("pay/{amount}")
	public String pay(Model model,@PathVariable(value="amount") int amount)
	{
		model.addAttribute("amt",1);
		return "payment";
	}
}
