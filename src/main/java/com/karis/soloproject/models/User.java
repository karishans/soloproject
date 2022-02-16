package com.karis.soloproject.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="users")
public class User {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message="Must include first name")
	@Size(min=2, max=200, message="First name should be between 2-200 characters")
	private String firstName;
	
	@NotBlank(message="Must include last name")
	@Size(min=2, max=200, message="Last name should be between 2-200 characters")
	private String lastName;
	
	@Email
    private String email;
	
	@NotEmpty(message="must include address")
	private String address;
	
	@NotEmpty(message="must include city")
	private String city;
	
	@NotEmpty(message="must include state")
	private String state;
	
//	@Size(min=10, max=12, message="Phone number should be 10 digits")
//	@Pattern(regexp="^\\(?([0-9]{3})\\\\)?[-.\\\\s]?([0-9]{3})[-.\\\\s]?([0-9]{4})$", message="must be phone number format")
	@Pattern(regexp="^[a-zA-Z0-9]{10}",message="length must be 10")  
	private String phone;
	
	@NotBlank
	@Size(min=8, max=255, message="Password should be at least 8 characters long")
    private String password;
	
	@NotBlank
    @Transient //don't save in database
    private String passwordConfirmation;
    
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	    
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	@OneToMany(mappedBy="owner", fetch=FetchType.LAZY)
	private List<Pet> petsOwned;
	
	@OneToMany(mappedBy="parent", fetch=FetchType.LAZY)
	private List<MissingPet> petsMissing;
	
	@OneToMany(mappedBy="author", fetch=FetchType.LAZY)
	private List<Message> messages;
	
	public User() {
		
	}
	
	
	
	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getFirstName() {
		return firstName;
	}



	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}



	public String getLastName() {
		return lastName;
	}



	public void setLastName(String lastName) {
		this.lastName = lastName;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getCity() {
		return city;
	}



	public void setCity(String city) {
		this.city = city;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}



	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
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

	

	public List<Pet> getPetsOwned() {
		return petsOwned;
	}



	public void setPetsOwned(List<Pet> petsOwned) {
		this.petsOwned = petsOwned;
	}

	

	public List<MissingPet> getPetsMissing() {
		return petsMissing;
	}



	public void setPetsMissing(List<MissingPet> petsMissing) {
		this.petsMissing = petsMissing;
	}



	public List<Message> getMessages() {
		return messages;
	}



	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}



	@PrePersist
    protected void onCreate(){ //when object is created save the Date that the object is created at
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){ //when object is updated save the Date that the object is updated at
        this.updatedAt = new Date();
    }
	
	
}
