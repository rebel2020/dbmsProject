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

import com.brijesh.CartController;
import com.brijesh.dao.Offerdao;
import com.brijesh.model.Offer;

@Controller
public class OfferController {
	@Autowired
	Offerdao offerdao;
	@RequestMapping("admin/offers")
	public String offers(Model model)
	{
		List<Offer> list=offerdao.getAllOffers();
		model.addAttribute("list",list);
		return "admin/offers";
	}
	@RequestMapping("admin/offer/switch_status/{offerId}")
	public String switchStatus(Model model,@PathVariable(value="offerId") int offerId)
	{
		offerdao.switchStatus(offerId);
		return "redirect:/admin/offers";
	}
	@RequestMapping(value="admin/add_offer",method=RequestMethod.GET)
	public String addOffer(Model model)
	{
		Offer offer=new Offer();
		model.addAttribute("offer",offer);
		return "admin/addOffer";
	}
	@RequestMapping(value="admin/add_offer", method=RequestMethod.POST)
	public String addOffer(@Valid @ModelAttribute("offer") Offer offer,BindingResult result,Model model)
	{
		if(result.hasErrors())
		{
			return "redirect:/admin/add_offer";
		}
		else
		{
			offerdao.addOffer(offer);
			return "redirect:/admin/offers";
		}
	}
}
