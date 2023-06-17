package com.jquinones.soloproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jquinones.soloproject.models.Message;

@Repository
public interface MessageRepository extends CrudRepository<Message, Long> {

	List<Message> findAll();
}
