package com.brijesh;
import com.brijesh.model.Employee;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.brijesh.dao.Employeedao;
import com.brijesh.dao.EmployeedaoImpl;
@Controller
public class EmployeeController {
	@Autowired
	Employeedao employeedao;
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
}
