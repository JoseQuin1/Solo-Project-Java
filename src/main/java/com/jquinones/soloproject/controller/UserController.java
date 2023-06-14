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
import com.jquinones.soloproject.models.LoginUser;
import com.jquinones.soloproject.models.User;
import com.jquinones.soloproject.services.DogService;
import com.jquinones.soloproject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;



@Controller
public class UserController {
 
 
  @Autowired
  private UserService userServ;
  
  @Autowired
  private DogService dogServ;

 
  
  @GetMapping("/login")
  private String login(Model model){
//    Bind empty User and LoginUser objects to the JSP
//    to capture the form input
   model.addAttribute("newUser", new User());
   model.addAttribute("newLogin", new LoginUser());
   return "login.jsp";
  }

  @GetMapping("/register")
  private String register(Model model) {
	  model.addAttribute("newUser", new User());
	  return "register.jsp";
  }
  
  @GetMapping("/profile")
  private String profile(Model model, HttpSession session) {
		 Long userId = (Long)session.getAttribute("userId");
		 User user = userServ.getOne((Long)session.getAttribute("userId"));
		 
		 if (userId == null) {
			 return "redirect:/login";
		 }
		 
		 model.addAttribute("user", user);
		 return "myAccount.jsp";
		 
  }
  
 
 @PostMapping("/register")
 public String register(@Valid @ModelAttribute("newUser") User newUser, 
         BindingResult result, Model model, HttpSession session) {
     

     userServ.register(newUser, result);
     
     if(result.hasErrors()) {

         model.addAttribute("newLogin", new LoginUser());
         return "register.jsp";
     }else {
    	 userServ.register(newUser, result);
    	 session.setAttribute("userId",newUser.getId());
    	 return "redirect:/profile";
     }
 
 }
 
 @PostMapping("/login")
 public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
         BindingResult result, Model model, HttpSession session) {
     
	 
      User user = userServ.login(newLogin, result);
 
     if(result.hasErrors()) {
         model.addAttribute("newUser", new User());
         return "login.jsp";
     }
	 else{
		 session.setAttribute("userId", user.getId());
		 return "redirect:/profile";
	 }
 }
 
 @GetMapping("/logout")
 public String logout(HttpSession session) {
	 session.invalidate();
	 return "redirect:/login";
 }
 
	@GetMapping("/user/like/{dogId}")
	public String likeDog(@PathVariable("dogId") Long dogId, 
			HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		Dog thisDog = dogServ.findById(dogId);
		User thisUser = userServ.getOne((Long)session.getAttribute("userId"));
		dogServ.likedDog(thisDog, thisUser);
		return "redirect:/puppy/"+dogId;
	}
	
	@GetMapping("/user/unlike/{dogId}")
	public String unlikeDog(@PathVariable("dogId") Long dogId, 
			HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		Dog thisDog = dogServ.findById(dogId);
		User thisUser = userServ.getOne((Long)session.getAttribute("userId"));
		dogServ.unlikeDog(thisDog, thisUser);
		return "redirect:/puppy/"+dogId;
	}
 
}