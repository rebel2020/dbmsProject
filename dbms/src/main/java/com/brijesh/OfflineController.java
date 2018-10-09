package com.brijesh;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.brijesh.dao.Itemdao;
import com.brijesh.dao.Offlinedao;
import com.brijesh.model.OfflineRecord;

@Controller
public class OfflineController {

	@Autowired
	Offlinedao offlinedao;
	@Autowired
	Itemdao itemdao;
	
	@RequestMapping(value="offline/add_record",method=RequestMethod.GET)
	public String addrecord(Model model,HttpServletRequest request)
	{
		OfflineRecord record=new OfflineRecord();
		model.addAttribute("record",record);
		return "admin/addRecord";
	}
	@RequestMapping(value="offline/add_record",method=RequestMethod.POST)
	public String addrecord(@Valid @ModelAttribute("record") OfflineRecord record,BindingResult result,Model model)
	{
		if(result.hasErrors() || itemdao.getItem(record.getItemId())==null ||record.getAmount()!=record.getQuantity()*itemdao.getItem(record.getItemId()).getPrice() )
		{
			model.addAttribute("error","Incorrect details..fill it properly");
			model.addAttribute("order",new OfflineRecord());
			return "admin/addRecord";
		}
		else
		{
			record.setDate(java.time.LocalDate.now().toString());  
			offlinedao.newRecord(record);
			return "redirect:/offline/records";
		}
	}
	@RequestMapping("offline/records")
	public String records(Model model)
	{
		List<OfflineRecord> list=offlinedao.getAllRecords();
		model.addAttribute("list",list);
		return "admin/records";
	}
}
