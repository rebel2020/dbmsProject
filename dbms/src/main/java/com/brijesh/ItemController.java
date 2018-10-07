package com.brijesh;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.brijesh.model.Item;
import com.brijesh.dao.Itemdao;
import com.brijesh.dao.ItemdaoImpl;
@Controller
public class ItemController {
	@Autowired
	Itemdao itemdao;
	@RequestMapping(value="admin/additem",method=RequestMethod.GET)
	public String addItem(Model model) 
	{
		Item item=new Item();
		model.addAttribute("today",LocalDate.now().toString());
		model.addAttribute("item",item);
		return "admin/addItem";
	}
	@RequestMapping(value="admin/additem",method=RequestMethod.POST)
	public String addItem(@Valid @ModelAttribute("Item") Item item,BindingResult result,Model model,@RequestParam CommonsMultipartFile file) throws IOException, ClassNotFoundException, SQLException 
	{
		if(result.hasErrors())
		{
			model.addAttribute("item",item);
			return "admin/addItem";
		}
		else {
			byte[] barr=file.getBytes();
			InputStream is=file.getInputStream();
			itemdao.addItem(item,is,barr);
			return "redirect:/admin";
		}
	}
	@RequestMapping("items")
	public String allitems(Model model) throws SQLException
	{
		List<Item> list=itemdao.getAllItems();
		Iterator<Item> itr=list.iterator();
		while(itr.hasNext())
		{
			Item item=itr.next();
			item.setForImage(Base64.getEncoder().encodeToString(item.getPhoto().getBytes(1, (int) item.getPhoto().length())));
		}
		model.addAttribute("list",list);
		return "allItems";
	}
	@RequestMapping("admin/items")
	public String allitemsAdmin(Model model) throws SQLException
	{
		List<Item> list=itemdao.getAllItems();
		Iterator<Item> itr=list.iterator();
		while(itr.hasNext())
		{
			Item item=itr.next();
			item.setForImage(Base64.getEncoder().encodeToString(item.getPhoto().getBytes(1, (int) item.getPhoto().length())));
		}
		model.addAttribute("list",list);
		return "admin/allItems";
	}
	@RequestMapping("/admin/deleteitem/{itemId}")
	public String deleteItem(@PathVariable(value="itemId") int itemId)
	{
		itemdao.deleteItem(itemId);
		return "redirect:/admin";
	}
	@RequestMapping("item/{itemId}")
	public String getItem(@PathVariable(value="itemId") int itemId,Model model) throws SQLException
	{
		Item item=itemdao.getItem(itemId);
		model.addAttribute("item",item);
		byte[] barr=item.getPhoto().getBytes(1, (int) item.getPhoto().length());
		String image=Base64.getEncoder().encodeToString(barr);
		model.addAttribute("image",image);
		return "item";
	}
	@RequestMapping("admin/item/{itemId}")
	public String getAdminItem(@PathVariable(value="itemId") int itemId,Model model) throws SQLException
	{
		Item item=itemdao.getItem(itemId);
		model.addAttribute("item",item);
		byte[] barr=item.getPhoto().getBytes(1, (int) item.getPhoto().length());
		String image=Base64.getEncoder().encodeToString(barr);
		model.addAttribute("image",image);
		return "admin/item";
	}
}
