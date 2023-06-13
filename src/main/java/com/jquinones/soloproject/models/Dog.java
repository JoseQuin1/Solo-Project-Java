package com.jquinones.soloproject.models;


import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="doggies")
public class Dog {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message="Name required")
	@Size(min=3, max=128, message="Name must be at least 3 characters long.")
    private String name;
	
	@NotNull(message="Age is required")
    private Integer age;
	
	@NotBlank(message="Breed is required")
    private String breed;
	
	@NotNull(message="Weight is required")
	private Integer weight;
	
	@NotBlank(message="Color is required!")
	private String color;
	
	@NotBlank(message="Status is required!")
	private String status;
	
	@NotBlank(message="Gender is required!")
	private String gender;
	
	@NotNull(message="Price is required!")
	@Min(value=1, message="Price must be greater than 1!")
	private Double price;
	
	private String fileName;
	
	@Lob
	@Column(name="content", columnDefinition = "BLOB")
	private byte[] content;
	
//    @DateTimeFormat(pattern="yyyy-MM-dd")
//    @NotNull(message="Available Date is required!")
//    private Date availableDate;
	
	@Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
	@OneToMany(mappedBy="dog", fetch=FetchType.LAZY)
    private List<Review> reviews;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
    
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "users_dogs",
			joinColumns = @JoinColumn(name = "dog_id"),
			inverseJoinColumns = @JoinColumn(name = "user_id")
	)
    private List<User> userWhoLiked;
	
    public Dog() {}
    
    public Dog(String name,Integer age,String breed,Integer weight,String color, String status, String gender, String fileName, Double price) {
    	this.name = name;
    	this.age = age;
    	this.breed = breed;
    	this.weight = weight;
    	this.color = color;
    	this.status = status;
    	this.gender = gender;
    	this.fileName = fileName;
    	this.price = price;
    }
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUserWhoLiked() {
		return userWhoLiked;
	}

	public void setUserWhoLiked(List<User> userWhoLiked) {
		this.userWhoLiked = userWhoLiked;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
	
    
}