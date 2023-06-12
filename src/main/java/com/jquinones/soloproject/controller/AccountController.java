package com.jquinones.soloproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
			 
			 if(userId == null) {
				 return "redirect:/login";
			 }
			 
			 if(user.getProfile().equals("Breeder")) {
				 model.addAttribute("doggies", dogServ.all());
				 model.addAttribute("user", user);
				 return "myCatalog.jsp";
			 }
			 
			 return "redirect:/profile";
	  }
}
