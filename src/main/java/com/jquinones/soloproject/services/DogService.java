package com.jquinones.soloproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jquinones.soloproject.models.Dog;
import com.jquinones.soloproject.models.User;
import com.jquinones.soloproject.repositories.DogRepository;

@Service
public class DogService {
		
		@Autowired
		private DogRepository repo;
		
		public Dog findById(Long id) {
			
			Optional<Dog> result = repo.findById(id);
			if(result.isPresent()) {
				return result.get();
			}
			
			return null;
		}
		

		public List<Dog> all() {
			return repo.findAll();
		}
		
		public Dog create(Dog dog) {
			return repo.save(dog);
		}
		
		public void delete(Long id) {
			repo.deleteById(id);
		}
		
		public Dog update(Dog dog) {
			return repo.save(dog);
		}
		
		public void likedDog(Dog thisDog, User user) {
			List<User> likers = thisDog.getUserWhoLiked();
			likers.add(user);
			this.update(thisDog);
		}
		
		public List<Dog> findAllWithImg(){
			return repo.findAllWithImg();
		}
	}
