package com.jquinones.soloproject.repositories;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jquinones.soloproject.models.Dog;


@Repository
public interface DogRepository extends CrudRepository<Dog, Long>, JpaRepository<Dog, Long>{

	 List<Dog> findAll();
}






