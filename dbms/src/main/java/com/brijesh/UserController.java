package com.brijesh;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.brijesh.dao.Contactdao;
import com.brijesh.dao.Userdao;
import com.brijesh.model.Contact;
import com.brijesh.model.User;

@Controller
public class UserController {
	@Autowired
	Contactdao contactdao;
	@Autowired
	Userdao userdao;
	
	@RequestMapping("contacts")
	public String getContacts(Model model,HttpServletRequest request)
	{
		model.addAttribute("list",contactdao.getContacts(request.getUserPrincipal().getName()));
		return "contacts";
	}
	
	@RequestMapping(value="add_contact",method=RequestMethod.GET)
	public String addContact(Model model)
	{
		Contact contact=new Contact();
		model.addAttribute("contact",contact);
		return "contactForm";
	}
	@RequestMapping(value="add_contact",method=RequestMethod.POST)
	public String addContact(@Valid @ModelAttribute("contact") Contact contact,BindingResult result,Model model,HttpServletRequest request)
	{
		if(result.hasErrors())
		{
			return "redirect:/add-contact";
		}
		else
		{
			contact.setUserId(request.getUserPrincipal().getName());
			contactdao.addContact(contact);
			return "redirect:/profile";
		}
	}
	@RequestMapping(value="edit_profile", method=RequestMethod.GET)
	public String editProfile(Model model,HttpServletRequest request)
	{
		User user=userdao.getUser(request.getUserPrincipal().getName());
		model.addAttribute("user",user);
		return "editProfile";
	}
	@RequestMapping(value="edit_profile", method=RequestMethod.POST)
	public String editProfile(HttpServletRequest request) throws IOException, ClassNotFoundException, SQLException
	{
		User user=new User();
		user.setAddress(request.getParameter("address"));
		user.setName(request.getParameter("name"));
		user.setContact(request.getParameter("contact"));
		user.setDOB(request.getParameter("DOB"));
		userdao.editProfile(user,request.getUserPrincipal().getName()); 
		return "redirect:/profile";
	}
	@RequestMapping("delete_contact/{contactId}")
	public String deleteContact(@PathVariable(value="contactId") int contactId,HttpServletRequest request)
	{
		contactdao.deleteContact(contactId);
		return "redirect:/contacts";
	}
	@RequestMapping(value="profile/reset_password",method=RequestMethod.GET)
	public String resetPassword(Model model)
	{
		return "passwordResetForm";
	}
	@RequestMapping(value="profile/reset_password",method=RequestMethod.POST)
	public String resetPassword(Model model,HttpServletRequest request)
	{
		String s1=userdao.getUser(request.getUserPrincipal().getName()).getPassword();
		String s2=request.getParameter("oldPass");
		
		if(s1.equals(s2))
		{
			model.addAttribute("error","Updated successfully");
			userdao.resetPassword(request.getUserPrincipal().getName(),request.getParameter("password") );
			return "redirect:/profile";
		}
		else
		{
			model.addAttribute("error","Password couldn't reset");
			return "redirect:/profile";
		}
	}
	@RequestMapping(value="changeprofilepic",method=RequestMethod.GET )
	public String changeProfilepic(Model model)
	{
		return "profilePicForm";
		
	}
	@RequestMapping(value="changeprofilepic",method=RequestMethod.POST )
	public String changeProfilepic(Model model,HttpServletRequest request,@RequestParam CommonsMultipartFile file) throws IOException, ClassNotFoundException, SQLException
	{
		byte[] barr=file.getBytes();
		InputStream is=file.getInputStream();
		userdao.changeProfilePic(request.getUserPrincipal().getName(), is, barr);
		return "redirect:/profile";
	}
	@RequestMapping("aboutus")
	public String aboutUs()
	{
		return "aboutus";
	}
}
