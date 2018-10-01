package com.brijesh;

import java.util.*;
import java.security.Principal;

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

import com.brijesh.dao.Userdao;
import com.brijesh.model.User;

@Controller
public class LoginController {

	@Autowired
	public Userdao userdao;
	
	@RequestMapping("profile")
	public String profile(Model model,HttpServletRequest request)
	{
		User user =new User();
		user=userdao.getUser(request.getUserPrincipal().getName());
		model.addAttribute("user",user);
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
	public String viewDetails(Model model,@PathVariable(value="userId") String userId)
	{
		User user=userdao.getUser(userId);
		model.addAttribute("user",user);
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
		if(result.hasErrors()) {
			return "register";
		}
		else {
			if(!user.getPassword().equals(user.getMpassword())) {
				model.addAttribute("error","passwords dont match");
				return "register";
			}
			if(userdao.getUser(user.getUsername())!=null) {
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
}
