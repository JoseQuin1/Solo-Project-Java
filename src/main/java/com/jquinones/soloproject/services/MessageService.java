package com.jquinones.soloproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jquinones.soloproject.models.Message;
import com.jquinones.soloproject.repositories.MessageRepository;

@Service
public class MessageService {

	@Autowired
	private MessageRepository repo;
	
	public Message findById(Long id) {
		
		Optional<Message> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	

	public List<Message> all() {
		return repo.findAll();
	}
	
	public Message create(Message message) {
		return repo.save(message);
	}
	
	public void delete(Long id) {
		repo.deleteById(id);
	}
	
	public Message update(Message message) {
		return repo.save(message);
	}
}
