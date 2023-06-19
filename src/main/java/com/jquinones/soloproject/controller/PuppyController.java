package com.jquinones.soloproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import com.jquinones.soloproject.models.Dog;
import com.jquinones.soloproject.models.Message;
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
			 Dog dog = new Dog("Sput",8,"Great Dane",140,"Gray","available","m","puppyImg1",4000.0);
			 Dog dog1 = new Dog("Ziggy",12,"Corgi",30,"Brown","available","m","puppyImg2",5000.0);
			 Dog dog2 = new Dog("Bell",9,"Golden Retriever",100,"Beige","available","f","puppyImg3",3200.0);
			 Dog dog3 = new Dog("Mike",11,"Labrador Retriever",110,"Brown","available","m","puppyImg4",3800.0);
			 Dog dog4 = new Dog("Maze",8,"Jack Rusell Terrier",35,"White","available","f","puppyImg5",4500.0);
			 Dog dog5 = new Dog("Mel",6,"Husky",90,"Brown","available","m","puppyImg6",3000.0);
			 Dog dog6 = new Dog("Kenzi",13,"German Shepherd",70,"White","available","m","puppyImg7",3700.0);
			 Dog dog7 = new Dog("Chester",15,"Pointer",110,"Black","available","f","puppyImg8",4800.0);
			 Dog dog8 = new Dog("Herbie",11,"King Charles Spaniel",30,"Beige","available","m","puppyImg9",5000.0);

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
		
	@GetMapping("travel")
	public String travel() {
		return "travel.jsp";
	}
	
	
	@GetMapping("/puppies")
	public String contactUs(Model model, 
			@ModelAttribute("newDogs")Dog newDogs,
			HttpSession session) {
	
		
		if(session.getAttribute("userId")!=null) {
			User thisUser = userServ.getOne((Long) session.getAttribute("userId"));
			model.addAttribute("dogs", dogServ.all());
			model.addAttribute("currentUser", thisUser);
			
			return "puppies.jsp";
		}
		
		model.addAttribute("dogs", dogServ.all());
		return "puppies.jsp";
	}
	

	
	@GetMapping("/like/{dogId}")
	public String likeDog(@PathVariable("dogId") Long dogId, 
			HttpSession session) {
		if (session.getAttribute("userId") != null) {
			Dog thisDog = dogServ.findById(dogId);
			User thisUser = userServ.getOne((Long)session.getAttribute("userId"));
			dogServ.likedDog(thisDog, thisUser);
			return "redirect:/puppies";
		}
		return "redirect:/login";

	}
	
	@GetMapping("/unlike/{dogId}")
	public String unlikeDog(@PathVariable("dogId") Long dogId, 
			HttpSession session) {
		if (session.getAttribute("userId") != null) {
			Dog thisDog = dogServ.findById(dogId);
			User thisUser = userServ.getOne((Long)session.getAttribute("userId"));
			dogServ.unlikeDog(thisDog, thisUser);
			return "redirect:/puppies";
			
		}
		return "redirect:/login";

	}
	
	@GetMapping("/puppy/{id}/delete")
	public String removePuppy(@PathVariable("id") Long id,
			HttpSession session) {
		Dog puppy = dogServ.findById(id);
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		if(!session.getAttribute("userId").equals(puppy.getUser().getId())) {
			return "redirect:/profile";
		}else {
			dogServ.delete(id);
			return "redirect:/myCatalog";
		}
	}
	
	@GetMapping("/puppy/{id}/edit")
	public String editBook(@PathVariable("id") Long id,
		Model model, HttpSession session){
		User user = userServ.getOne((Long)session.getAttribute("userId"));
		model.addAttribute("user", user);
		Dog dog = dogServ.findById(id);
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		if (!session.getAttribute("userId").equals(dog.getUser().getId())) {
			return "redirect:/myCatalog";
		}
		else {
			model.addAttribute("dog", dogServ.findById(id));
			return "dogEdit.jsp";
		}

	}

	
	@PutMapping("/puppy/{id}/edit")
	public String update(@Valid @ModelAttribute("dog") Dog dog,
			BindingResult result, @PathVariable("id")Long id, HttpSession session,
			Model model) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/profile";
		}
		
		if(result.hasErrors()) {
			return "dogEdit.jsp";
		}else {
			dog.setUser(userServ.getOne((Long)session.getAttribute("userId")));
			dogServ.update(dog);
			return "redirect:/myCatalog";
		}
	}

	
	@GetMapping("/puppy/{id}")
	public String puppyShow(Model model, @PathVariable("id") Long id,
			HttpSession session) {
		
		if(session.getAttribute("userId")!=null) {
			User thisUser = userServ.getOne((Long) session.getAttribute("userId"));
			model.addAttribute("oneDog", dogServ.findById(id));
			model.addAttribute("currentUser", thisUser);
			model.addAttribute("message", new Message());
			
			return "puppyDetails.jsp";
		}
		
		model.addAttribute("message", new Message());
		model.addAttribute("oneDog", dogServ.findById(id));
		return "puppyDetails.jsp";
	}
	
	@PostMapping("/doggies/new")
	public String newDog(@Valid @ModelAttribute("dog") Dog dog,
		BindingResult result, Model model, HttpSession session) {
		
		if (session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		
		if (result.hasErrors()) {
			model.addAttribute("newPup", new Dog());
			return "myCatalog.jsp";
		}

		dog.setUser(userServ.getOne((Long)session.getAttribute("userId")));
		dogServ.create(dog);
		return "redirect:/myCatalog";
//		@RequestParam("file") MultipartFile file,
//		
//			try {
//				dog.setUser(userServ.getOne((Long)session.getAttribute("userId")));
//				dog.setFileName(file.getOriginalFilename());
//				dog.setContent(file.getBytes());
//				dogServ.create(dog);
//				return "redirect:/myCatalog";
//			}catch(IOException e) {
//				e.printStackTrace();
//				return "error";
//			}
	}
	
}
