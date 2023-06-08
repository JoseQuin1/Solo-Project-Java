package com.jquinones.soloproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.jquinones.soloproject.models.LoginUser;
import com.jquinones.soloproject.models.User;
import com.jquinones.soloproject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

//.. don't forget to include all your imports! ..

@Controller
public class UserController {
 
 // Add once service is implemented:
  @Autowired
  private UserService userServ;
 
     // Bind empty User and LoginUser objects to the JSP
     // to capture the form input
//     model.addAttribute("newUser", new User());
//     model.addAttribute("newLogin", new LoginUser());
 
 @GetMapping("/teams")
 public String books(Model model, HttpSession session){
	 Long userId = (Long) session.getAttribute("userId");
	 
	 if(userId == null) {
		 return "redirect:/";
	 }
	 else {
		 model.addAttribute("user", userServ.getOne((Long)session.getAttribute("userId")));
		 return "dashboard.jsp";
	 }
 }
 
 @PostMapping("/register")
 public String register(@Valid @ModelAttribute("newUser") User newUser, 
         BindingResult result, Model model, HttpSession session) {
     
     // TO-DO Later -- call a register method in the service 
     // to do some extra validations and create a new user!
     userServ.register(newUser, result);
     
     if(result.hasErrors()) {
         // Be sure to send in the empty LoginUser before 
         // re-rendering the page.
         model.addAttribute("newLogin", new LoginUser());
         return "index.jsp";
     }else {
    	 userServ.register(newUser, result);
    	 session.setAttribute("userId",newUser.getId());
    	 return "redirect:/teams";
     }
 
 }
 
 @PostMapping("/login")
 public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
         BindingResult result, Model model, HttpSession session) {
     
     // Add once service is implemented:
      User user = userServ.login(newLogin, result);
 
     if(result.hasErrors()) {
         model.addAttribute("newUser", new User());
         return "index.jsp";
     }
     else {
    	 session.setAttribute("userId", user.getId());
    	 System.out.println(user.getId());
    	 return "redirect:/teams";
     }
 
     // No errors! 
     // TO-DO Later: Store their ID from the DB in session, 
     // in other words, log them in.
 }
 
 @GetMapping("/logout")
 public String logout(HttpSession session) {
	 session.invalidate();
	 return "redirect:/";
 }
 
}