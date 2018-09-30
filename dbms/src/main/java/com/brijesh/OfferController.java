package com.brijesh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.brijesh.dao.Offerdao;

@Controller
public class OfferController {
	@Autowired
	Offerdao offerdao;
	@RequestMapping("{orderId}/apply_offer/{offerId}")
	public void applyOffer(Model model,@PathVariable(value="orderId") int orderId,@PathVariable(value="offerId") int offerId)
	{
		return;
	}
}
