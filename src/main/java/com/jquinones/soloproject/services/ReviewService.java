package com.jquinones.soloproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jquinones.soloproject.models.Review;
import com.jquinones.soloproject.repositories.ReviewRepository;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewRepository repo;
	
	public Review findById(Long id) {
		
		Optional<Review> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	

	public List<Review> all() {
		return repo.findAll();
	}
	
	public Review create(Review review) {
		return repo.save(review);
	}
	
	public void delete(Long id) {
		repo.deleteById(id);
	}
	
	public Review update(Review review) {
		return repo.save(review);
	}
}
