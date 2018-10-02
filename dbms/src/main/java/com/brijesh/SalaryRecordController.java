package com.brijesh;

import java.util.Calendar;

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
import com.brijesh.dao.Salarydao;
import com.brijesh.model.SalaryRecord;

@Controller
public class SalaryRecordController {
	@Autowired
	Salarydao salarydao;
	@Autowired
	Employeedao employeedao;
	
	@RequestMapping(value="salary/add_record/{empId}",method=RequestMethod.GET)
	public String addRecord(Model model,@PathVariable(value="empId") int empId)
	{
		Calendar cal=Calendar.getInstance();
		SalaryRecord record=new SalaryRecord();
		record.setEmpId(empId);
		if(salarydao.isPaid(empId, cal.get(cal.MONTH), cal.get(cal.YEAR)))
		{
			model.addAttribute("error","Already paid for this month");
//			return "admin/error";
		}
		model.addAttribute("month",cal.get(cal.MONTH));
		model.addAttribute("year",cal.get(cal.YEAR));
		model.addAttribute("salary",employeedao.getEmployee(empId).getSalary());
		model.addAttribute("record",record);
		return "admin/salaryForm";
	}
	@RequestMapping(value="salary/add_record/{empId}",method=RequestMethod.POST)
	public String addRecord(Model model,@Valid @ModelAttribute("record") SalaryRecord record,BindingResult result)
	{
		if(result.hasErrors())
		{
			model.addAttribute("error","Incorrect Information filled");
			model.addAttribute("record",record);
			return "admin:/salaryForm";
		}
		else
		{
			salarydao.addRecord(record);
			return "redirect:/salary/employee_records/"+record.getEmpId();
		}
	}
	@RequestMapping("salary/records")
	public String getAllRecords(Model model)
	{
		model.addAttribute("list",salarydao.getAllRecords());
		return "admin/salaryRecords";
	}
	@RequestMapping("salary/employee_records/{empId}")
	public String getRecords(Model model,@PathVariable(value="empId") int empId)
	{
		model.addAttribute("list",salarydao.getRecords(empId));
		model.addAttribute("empId",empId);
		return "admin/salaryEmpRecord";
	}
}
