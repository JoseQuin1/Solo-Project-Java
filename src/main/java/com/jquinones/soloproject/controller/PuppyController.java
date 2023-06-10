package com.jquinones.soloproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.jquinones.soloproject.models.Dog;
import com.jquinones.soloproject.models.Puppy;
import com.jquinones.soloproject.services.DogService;
import com.jquinones.soloproject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class PuppyController {
	
	@Autowired
	private DogService dogServ;
	@Autowired
	private UserService userServ;
	
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
	
	@PostMapping("/doggies/new")
	public String newDog(@Valid @ModelAttribute("dog") Dog dog,
		BindingResult result, Model model, HttpSession session) {
		
		if (session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		
		if (result.hasErrors()) {
			return "profile-breeder.jsp";
		}
		else {
			dog.setUser(userServ.getOne((Long)session.getAttribute("userId")));
			dogServ.create(dog);
			return "redirect:/profile";
		}
	}
	
}
