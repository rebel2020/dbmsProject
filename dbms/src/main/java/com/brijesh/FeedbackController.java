package com.brijesh;

import com.brijesh.dao.Feedbackdao;
import com.brijesh.model.Feedback;

import java.util.Date;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
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
import java.security.Principal;
import java.time.LocalDate;

@Controller
public class FeedbackController {
	@Autowired
	Feedbackdao feedbackdao;
	@RequestMapping(value="givefeedback/{itemId}",method=RequestMethod.GET)
	public String addFeedback(Model model,@PathVariable(value="itemId") int itemId,HttpServletRequest request)
	{
		Principal principal=request.getUserPrincipal();
		Feedback feedback=new Feedback();
		feedback.setItemId(itemId);
		feedback.setUserId(principal.getName());
//		feedback.setDate=((Date)LocalDate.now());
		model.addAttribute("feedback",feedback);
		return "addFeedback";
	}
	
	@RequestMapping(value="givefeedback/{itemId}",method=RequestMethod.POST)
	public String addfeedback(@Valid @ModelAttribute("Feedback") Feedback feedback,BindingResult result,Model model,@PathVariable(value="itemId") int itemId)
	{
		if(result.hasErrors())
		{
			model.addAttribute("error","yes");
			return "redirect:/feedback/"+itemId;
		}
		else
		{
			feedbackdao.addFeedback(feedback);
			return "redirect:/user";
		}
	}
	@RequestMapping("feedbacks/{itemId}")
	public String getAllFeedback(@PathVariable(value="itemId") int itemId,Model model)
	{
		List<Feedback> list=(List<Feedback>) feedbackdao.getFeedbacks(itemId);
		model.addAttribute("list",list);
		return "Feedbacks";
	}
}
