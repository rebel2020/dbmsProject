package com.brijesh;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.brijesh.dao.BigOrderdao;
import com.brijesh.model.BigOrder;

@Controller 
public class BigOrderController {
	@Autowired
	BigOrderdao bigorderdao;
	
	@RequestMapping(value="bigorder/fill_details/{orderId}", method=RequestMethod.GET)
	public String filldetail(Model model,@PathVariable(value="orderId") int orderId)
	{
		BigOrder order=bigorderdao.getOrder(orderId);
		model.addAttribute("order",order);
		return "fillDetails";
	}
	@RequestMapping(value="bigorder/fill_details/{orderId}", method=RequestMethod.POST)
	public String filldetail(Model model,HttpServletRequest request,@Valid @ModelAttribute("BigOrder") BigOrder order,BindingResult result)
	{
		if(result.hasErrors())
		{
			BigOrder neworder=bigorderdao.getOrder(order.getOrderId());
			model.addAttribute("order",neworder);
			model.addAttribute("error","Incorrect information");
			return "fillDetails";
		}
		order.setUserId(request.getUserPrincipal().getName());
		bigorderdao.fillDetails(request.getUserPrincipal().getName(), order);
		List<BigOrder> list=bigorderdao.getUserOrders(request.getUserPrincipal().getName());
		model.addAttribute("success","Saved successfully");
		model.addAttribute("list",list);
		return "bigOrders";
	}
	@RequestMapping("admin/bigorder/confirm/{orderId}")
	public String confirmOrder(@PathVariable(value="orderId") int orderId,Model model,HttpServletRequest request)
	{
		if(bigorderdao.getOrder(orderId).getPrice()==0)
		{
			List<BigOrder> list=bigorderdao.getAllOrders();
			model.addAttribute("list",list);
			model.addAttribute("error","Please enter the Price first"); 
			return "admin/bigOrders";
		}
		bigorderdao.confirmOrder(orderId);
		return "admin/bigOrders";
	}
	@RequestMapping("admin/bigorders")
	public String getBigOrders(Model model)
	{
		List<BigOrder> list=bigorderdao.getAllOrders();
		model.addAttribute("list",list);
		return "admin/bigOrders";
	}
	@RequestMapping("bigorders")
	public String getBigOrders(Model model,HttpServletRequest request)
	{
		List<BigOrder> list=bigorderdao.getUserOrders(request.getUserPrincipal().getName());
		model.addAttribute("list",list);
		return "bigOrders";
	}
	@RequestMapping(value="bigorder/placeorder",method=RequestMethod.GET)
	public String placeBigOrder(Model model,HttpServletRequest request)
	{
		BigOrder order=new BigOrder();
		order.setUserId(request.getUserPrincipal().getName());
		model.addAttribute("order",order);
		return "placeOrderForm";
	}
	@RequestMapping(value="bigorder/placeorder",method=RequestMethod.POST)
	public String placeBigOrder(@Valid @ModelAttribute("order") BigOrder order,HttpServletRequest request,BindingResult result)
	{
		if(result.hasErrors())
		{
			return "placeOrderForm";
		}
		order.setUserId(request.getUserPrincipal().getName());
		bigorderdao.addOrder(order);
		return "redirect:/bigorders";
	}
	@RequestMapping("admin/set_price/{orderId}")
	public String setPrice(Model model,@PathVariable(value="orderId") int orderId,HttpServletRequest request)
	{
		bigorderdao.enterPrice(orderId, Integer.parseInt(request.getParameter("price")));
		model.addAttribute("success","Price added Successfuly");
		List<BigOrder> list=bigorderdao.getAllOrders();
		model.addAttribute("list",list);
		return "admin/bigOrders";
		
	}
	@RequestMapping("bigorder/delivered/{orderId}")
	public String markDelivered(Model model,@PathVariable(value="orderId") int orderId,HttpServletRequest request)
	{
		bigorderdao.userDeliveryConfirm(orderId);
		List<BigOrder> list=bigorderdao.getUserOrders(request.getUserPrincipal().getName());
		model.addAttribute("list",list);
		model.addAttribute("success","Marked successfully");
		return "bigOrders";
	}
	@RequestMapping("admin/bigorder/delivered/{orderId}")
	public String markDeliveredAdmin(Model model,@PathVariable(value="orderId") int orderId)
	{
		bigorderdao.adminDeliveryConfirm(orderId);
		List<BigOrder> list=bigorderdao.getAllOrders();
		model.addAttribute("list",list);
		model.addAttribute("success","Marked successfully");
		return "admin/bigOrders";
	}
	@RequestMapping("bulk")
	public String buyInBulk(Model model)
	{
		return "bulk";
	}
}
