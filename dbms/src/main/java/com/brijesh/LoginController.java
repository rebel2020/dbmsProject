package com.brijesh;

import java.util.*;
import java.security.Principal;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.brijesh.dao.Employeedao;
import com.brijesh.dao.Userdao;
import com.brijesh.model.Employee;
import com.brijesh.model.User;

@Controller
public class LoginController {

	@Autowired
	public Userdao userdao;
	@Autowired 
	Employeedao employeedao;
	
	@RequestMapping("profile")
	public String profile(Model model,HttpServletRequest request) throws SQLException
	{
		User user =new User();
		user=userdao.getUser(request.getUserPrincipal().getName());
		model.addAttribute("user",user);
		if(user.getPhoto()!=null)
		{
			byte[] barr=user.getPhoto().getBytes(1, (int) user.getPhoto().length());
			String image=Base64.getEncoder().encodeToString(barr);
			model.addAttribute("image",image);
			model.addAttribute("isExist",true);
		}
		else
			model.addAttribute("isExist",false);
		return "profile";
	} 
	@RequestMapping(value = "/home")
	public String welcome(Model model) {
		model.addAttribute("name", "Home Page");
		model.addAttribute("description", "unsecured page !");
		return "home";
	}
	@RequestMapping("/admin")
	public String admin(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("user", loggedInUserName);
		model.addAttribute("name", "Spring Security Custom Login Demo");
		model.addAttribute("description", "Protected page !");
		return "admin";
	}
	@RequestMapping("admin/users")
	public String allUsers(Model model)
	{
		List<User> list=userdao.getAllUsers();
		model.addAttribute("list",list);
		return "admin/allUsers";
	}
	@RequestMapping("admin/view_details/{userId}")
	public String viewDetails(Model model,@PathVariable(value="userId") String userId) throws SQLException
	{
		User user=userdao.getUser(userId);
		model.addAttribute("user",user);
		if(user.getPhoto()!=null)
		{
			String image=Base64.getEncoder().encodeToString(user.getPhoto().getBytes(1, (int) user.getPhoto().length()));
			model.addAttribute("image",image);
			model.addAttribute("isExist",true);
		}
		else model.addAttribute("isExist",false);
		return "admin/userDetails";
	}
	@RequestMapping("/user")
	public String user(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("user", loggedInUserName);
		model.addAttribute("name", "Spring Security USER Custom Login Demo");
		model.addAttribute("description", "Protected page for user !");
		return "user";
	}
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {

		return "login";

	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
//		model.addAttribute("message",
//				"You have successfully logged off from application !");
		return "login";

	}
	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";

	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register(Model model) {
		
		User user = new User();
		model.addAttribute("user", user);
		return "register";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerProcess(@Valid @ModelAttribute("user") User user,BindingResult result,Model model) {
		System.out.println(user.getDOB());
		if(result.hasErrors()) {
			return "register";
		}
		else {
			if(!user.getPassword().equals(user.getMpassword())) {
				model.addAttribute("error","passwords dont match");
				return "register";
			}
			if(userdao.getUser(user.getUsername())!=null || user.getDOB()==null) {
				model.addAttribute("error", "username exists");
				return "register";
			}
			userdao.saveOrUpdate(user);
			return "home";
		}
	}
	@RequestMapping(value="/user/products")
	public String checker(Model model,Principal principal) {
		String user = principal.getName();
		model.addAttribute("user",user);
		model.addAttribute("product","product");
		return "product";
	}
	@RequestMapping("admin/switch_status/{userId}")
	public String switchStatus(Model model,@PathVariable(value="userId") String userId)
	{
		userdao.switchStatus(userId);
		return "redirect:/admin/users";
	}
	@RequestMapping(value="/register/employee",method=RequestMethod.GET)
	public String registerEmployee(Model model) {
		
		User user = new User();
		model.addAttribute("user", user);
		return "employee/registerEmployee";
	}
	
	@RequestMapping(value="/register/employee",method=RequestMethod.POST)
	public String registerEmployee(@Valid @ModelAttribute("user") User user,BindingResult result,Model model) {
		System.out.println(user.getDOB());
		if(result.hasErrors()) {
			model.addAttribute("error", "Couldn't register..please try again");
			return "employee/registerEmployee";
		}
		else {
			if(!user.getPassword().equals(user.getMpassword())) {
				model.addAttribute("error","passwords dont match");
				return "employee/registerEmployee";
			}
			if(userdao.getUser(user.getUsername())!=null) {
				model.addAttribute("error", "username exists");
				return  "employee/registerEmployee";
			}
			if(employeedao.getEmployee(Integer.parseInt(user.getUsername()))==null)
			{
				model.addAttribute("error","Incorrect user ID. Please contact to the Admin.");
				return "employee/registerEmployee";
			}
			Employee employee=employeedao.getEmployee(Integer.parseInt(user.getUsername()));
			user.setName(employee.getName());
			user.setContact(employee.getContactNo());
			userdao.registerEmployee(user);
			return "redirect:/employee";
		}
	}
	@RequestMapping("employee/profile")
	public String employeeProfile(Model model,HttpServletRequest request) throws SQLException
	{
		User user =new User();
		user=userdao.getUser(request.getUserPrincipal().getName());
		model.addAttribute("user",user);
		if(user.getPhoto()!=null)
		{
			byte[] barr=user.getPhoto().getBytes(1, (int) user.getPhoto().length());
			String image=Base64.getEncoder().encodeToString(barr);
			model.addAttribute("image",image);
			model.addAttribute("isExist",true);
		}
		else
			model.addAttribute("isExist",false);
		return "employee/profile";
	}
}
