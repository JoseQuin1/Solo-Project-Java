package com.jquinones.soloproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.jquinones.soloproject.models.Review;
import com.jquinones.soloproject.services.DogService;
import com.jquinones.soloproject.services.ReviewService;
import com.jquinones.soloproject.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {
	
	@Autowired
	private UserService userServ;
	@Autowired
	private DogService dogServ;
	@Autowired
	private ReviewService reviewServ;
	
	@GetMapping("/reviews")
	public String review(@ModelAttribute("reviews")Review reviews,
			HttpSession session) {
		Long userId = (Long)session.getAttribute("userId");
		
//		if(userId == null) {
//			return "redirect:/login";
//		}
		
		return "review.jsp";
	}
}
