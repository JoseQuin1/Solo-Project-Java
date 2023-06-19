package com.jquinones.soloproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.jquinones.soloproject.models.Dog;
import com.jquinones.soloproject.models.Message;
import com.jquinones.soloproject.models.User;
import com.jquinones.soloproject.services.DogService;
import com.jquinones.soloproject.services.MessageService;
import com.jquinones.soloproject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AccountController {
	
	@Autowired
	private UserService userServ;
	@Autowired
	private DogService dogServ;
	@Autowired
	private MessageService messageServ;
	
	  @GetMapping("/myCatalog")
	  private String profile(Model model, HttpSession session) {
			 User user = userServ.getOne((Long)session.getAttribute("userId"));

			 if(session.getAttribute("userId") != null) {
				 if(user.getProfile().equals("Breeder")) {
					 model.addAttribute("doggies", dogServ.all());
					 model.addAttribute("user", user);
					 model.addAttribute("dog", new Dog());
					 return "myCatalog.jsp";
				 }else {
				 return "redirect:/profile";
				 }
			 }
			 return "redirect:/login";

	  }
	  
	  @GetMapping("/favorites")
	  public String fav(Model model,HttpSession session){
		  Long userId = (Long)session.getAttribute("userId");
		  User thisUser = userServ.getOne((Long)session.getAttribute("userId"));
		  
		  if(userId != null) {
			  model.addAttribute("currentUser", thisUser);
			  model.addAttribute("dogs", dogServ.all());
			  return "favorites.jsp";
		  }
		  return "redirect:/login";
	  }
	  
		@GetMapping("/userFavorite/unlike/{dogId}")
		public String unlikeDog(@PathVariable("dogId") Long dogId, 
				HttpSession session) {
			if (session.getAttribute("userId") == null) {
				return "redirect:/login";
			}
			Dog thisDog = dogServ.findById(dogId);
			User thisUser = userServ.getOne((Long)session.getAttribute("userId"));
			dogServ.unlikeDog(thisDog, thisUser);
			return "redirect:/favorites";
		}
		
		@GetMapping("/contactUs")
		public String contactUs(Model model, HttpSession session) {
			
			if(session.getAttribute("userId") !=null) {
				User user = userServ.getOne((Long)session.getAttribute("userId"));
				model.addAttribute("thisUser", user);
				model.addAttribute("message", new Message());
				return "contactUs.jsp"; 
			}
			
			model.addAttribute("message", new Message());
			return "contactUs.jsp"; 
		}
		
		@PostMapping("/contactUs")
		public String messageCreate(@Valid @ModelAttribute("message") Message message,
				BindingResult result, Model model,HttpSession session) {
			
			if(result.hasErrors()) {
				model.addAttribute("mess", new Message());
				return "contactUs.jsp";
			}
			
			if(session.getAttribute("userId") != null) {
				User user = userServ.getOne((Long)session.getAttribute("userId"));
				message.setUser(user);
				messageServ.create(message);
				return"redirect:/contactUs";
			}
			
			messageServ.create(message);
			return"redirect:/contactUs";
		}
			
}
