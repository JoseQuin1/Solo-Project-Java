package com.jquinones.soloproject.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jquinones.soloproject.models.File;

@Repository
public interface FileRepository extends JpaRepository<File, Long>{
	List<File> findAll();
}
