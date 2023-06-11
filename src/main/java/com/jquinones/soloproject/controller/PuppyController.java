package com.jquinones.soloproject.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jquinones.soloproject.models.Dog;
import com.jquinones.soloproject.models.User;
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
		 Long one = (long) 1;

		 if(dogServ.findById(one)==null) {
			 Dog dog = new Dog("Sput",8,"Great Dane",140,"Gray","available","m");
			 Dog dog1 = new Dog("Ziggy",12,"Corgi",30,"Brown","available","m");
			 Dog dog2 = new Dog("Bell",9,"Golden Retriever",100,"Beige","available","f");
			 Dog dog3 = new Dog("Mike",11,"Labrador Retriever",110,"Brown","available","m");
			 Dog dog4 = new Dog("Maze",8,"Jack Rusell Terrier",35,"White","available","f");
			 Dog dog5 = new Dog("Mel",6,"Husky",90,"Brown","available","m");
			 Dog dog6 = new Dog("Chester",13,"Pointer",70,"White","available","m");
			 Dog dog7 = new Dog("Kenzi",15,"German Shepherd",110,"Black","available","f");
			 Dog dog8 = new Dog("Herbie",11,"Cavalier King Charles Spaniel",30,"Beige","available","m");

			dogServ.create(dog);
			dogServ.create(dog1);
			dogServ.create(dog2);
			dogServ.create(dog3);
			dogServ.create(dog4);
			dogServ.create(dog5);
			dogServ.create(dog6);
			dogServ.create(dog7);
			dogServ.create(dog8);
		 }
		 
		 return "redirect:/puppyShop";
	 }

	@GetMapping("/puppyShop")
	public String index(Model model) {
		
		model.addAttribute("dogs", dogServ.all());
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
		model.addAttribute("dogs", dogServ.all());
		return "puppies.jsp";
	}
	
	@PostMapping("/doggies/new")
	public String newDog(@Valid @ModelAttribute("dog") Dog dog,
		@RequestParam("file")MultipartFile file,
		BindingResult result, Model model, HttpSession session) {
		
		if (session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		
		if (result.hasErrors()) {
			return "profile-breeder.jsp";
		}
		else {
			try {
			dog.setUser(userServ.getOne((Long)session.getAttribute("userId")));
			dog.setFileName(file.getOriginalFilename());
			dog.setContent(file.getBytes());
			dogServ.create(dog);
			return "redirect:/profile";
			}catch(IOException e) {
				e.printStackTrace();
				return "error";
			}
		}
	}
	
//	@PostMapping("/doggies/new")
//	public String newDog(@Valid @ModelAttribute("dog") Dog dog,
//		BindingResult result, Model model, HttpSession session) {
//		
//		if (session.getAttribute("userId") == null) {
//			return "redirect:/login";
//		}
//		
//		if (result.hasErrors()) {
//			return "profile-breeder.jsp";
//		}
//		else {
//			dog.setUser(userServ.getOne((Long)session.getAttribute("userId")));
//			dogServ.create(dog);
//			return "redirect:/profile";
//		}
//	}

	
	
	@GetMapping("/like/{dogId}")
	public String likeDog(@PathVariable("dogId") Long dogId, 
			HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		Dog thisDog = dogServ.findById(dogId);
		User thisUser = userServ.getOne((Long)session.getAttribute("userId"));
		dogServ.likedDog(thisDog, thisUser);
		return "redirect:/puppies";
	}
	
	@GetMapping("/puppy/{id}/delete")
	public String removePuppy(@PathVariable("id") Long id,
			HttpSession session) {
		Dog puppy = dogServ.findById(id);
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/profile";
		}
		if(!session.getAttribute("userId").equals(puppy.getUser().getId())) {
			return "redirect:/profile";
		}else {
			dogServ.delete(id);
			return "redirect:/profile";
		}
	}
	
}
