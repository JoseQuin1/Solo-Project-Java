package com.jquinones.soloproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jquinones.soloproject.models.File;
import com.jquinones.soloproject.repositories.FileRepository;


@RestController
public class FileController {

	@Autowired
	private FileRepository repo;
	
	@PostMapping("/file")
	public ResponseEntity<?>uploadFile(@RequestParam("file")MultipartFile file){
		try {
		File fileModel = new File();
		fileModel.setName(file.getOriginalFilename());
		fileModel.setContent(file.getBytes());
		repo.save(fileModel);
		return ResponseEntity.ok().body("File uploaded successfully");
		}catch(Exception e){
			return
				ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to upload file");
		}
	}
}
