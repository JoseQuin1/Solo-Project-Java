package com.jquinones.soloproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.jquinones.soloproject.models.Dog;
import com.jquinones.soloproject.models.User;
import com.jquinones.soloproject.services.DogService;
import com.jquinones.soloproject.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AccountController {
	
	@Autowired
	private UserService userServ;
	@Autowired
	private DogService dogServ;
	
	  @GetMapping("/myCatalog")
	  private String profile(Model model, HttpSession session) {
			 Long userId = (Long)session.getAttribute("userId");
			 User user = userServ.getOne((Long)session.getAttribute("userId"));

			 if(userId != null) {
				 if(user.getProfile().equals("Breeder")) {
					 model.addAttribute("doggies", dogServ.all());
					 model.addAttribute("user", user);
					 return "myCatalog.jsp";
				 }
				 return "redirect:/profile";
			 }
			 return "redirect:/login";

	  }
	  
	  @GetMapping("/favorites")
	  public String fav(Model model,HttpSession session){
		  
		  if(session.getAttribute("userId") != null) {
			  User thisUser = userServ.getOne((Long)session.getAttribute("userId"));
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
}
