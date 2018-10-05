package com.brijesh;
import com.brijesh.model.Employee;import java.time.LocalDate;
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

import com.brijesh.dao.Employeedao;
import com.brijesh.dao.EmployeedaoImpl;
import com.brijesh.dao.Orderdao;
@Controller
public class EmployeeController {
	@Autowired
	Employeedao employeedao;
	@Autowired
	Orderdao orderdao;
	
	@RequestMapping(value="admin/addemployee",method=RequestMethod.GET)
	public String addEmployee(Model model)
	{
		Employee employee=new Employee();
		model.addAttribute("employee",employee);
		return "admin/addEmployee";
	}
	@RequestMapping(value="admin/addemployee",method=RequestMethod.POST)
	public String addEmployee(@Valid @ModelAttribute("Employee") Employee employee,BindingResult result,Model model)
	{
		if(result.hasErrors())
		{
			return "redirect:/admin/addemployee";
		}
		else
		{
			employee.setJoiningDate(LocalDate.now().toString());
			employeedao.addEmployee(employee);
			return "redirect:/admin";
		}
	}
	@RequestMapping("admin/employees")
	public String allEmployees(Model model)
	{
		List<Employee> list=(List<Employee>)employeedao.getAllEmployee();
		model.addAttribute("list",list);
		return "admin/employees";
	}
	@RequestMapping("employee")
	public String employeeHomePage(Model model,HttpServletRequest request)
	{
		model.addAttribute("employee",employeedao.getEmployee(Integer.parseInt(request.getUserPrincipal().getName())));
		model.addAttribute("orders",orderdao.employeeUndeliveredOrders(Integer.parseInt(request.getUserPrincipal().getName())));
		return "employee/home";
	}
	@RequestMapping("employee/deliver/{orderId}")
	public String deliverOrder(Model model,HttpServletRequest request,@PathVariable(value="orderId") int orderId)
	{
		orderdao.orderConfirmation(request.getUserPrincipal().getName(), orderId);
		return "redirect:/employee";
	}
}
