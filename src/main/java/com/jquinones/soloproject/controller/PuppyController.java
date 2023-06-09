package com.jquinones.soloproject.controller;

import com.jquinones.soloproject.models.Puppy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PuppyController {
	
	 @GetMapping("/")
	 public String index() {
		 return "redirect:/puppyShop";
	 }

	@GetMapping("/puppyShop")
	public String index(Model model) {
		
		model.addAttribute("objList", Puppy.puppies());
		return "index.jsp";
	}
	
	@GetMapping("/aboutUs")
	public String aboutUs() {
		
		return "aboutUs.jsp";
	}
	
	@GetMapping("/contactUs")
	public String contactUs() {
		
		return "contactUs.jsp";
	}
	
	@GetMapping("/puppies")
	public String contactUs(Model model) {
		model.addAttribute("objList", Puppy.puppies());
		return "puppies.jsp";
	}
	
}
