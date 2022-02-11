package com.karis.soloproject.models;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="missing")
public class MissingPet {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	//Pet Id?
	
	@Past
	@DateTimeFormat(pattern="yyy-MM-dd")
	private Date lastseen;
	
	@NotEmpty(message="must include city")
	private String city;
	
	@NotEmpty(message="must include state")
	private String state;
	
	@Size(min=10, max=12, message="Phone number should be 10 digits")
	private String phone;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	    
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="pet_id")
	private Pet pet; 
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User parent;
	
	public String getDateFormatted() {
		SimpleDateFormat df = new SimpleDateFormat("MMMM dd, yyy");
		return df.format(this.lastseen);
	}
	
	public MissingPet() {
		
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getLastseen() {
		return lastseen;
	}

	public void setLastseen(Date lastseen) {
		this.lastseen = lastseen;
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

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}

	public User getParent() {
		return parent;
	}

	public void setParent(User parent) {
		this.parent = parent;
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
