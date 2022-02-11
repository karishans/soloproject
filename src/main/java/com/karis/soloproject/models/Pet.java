package com.karis.soloproject.models;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="pets")
public class Pet {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Size(min=2, max=20, message="Pet name should be between 2-20 chars")
	private String petName;
	
	@NotEmpty
	private String species;
	
	@NotEmpty
	private String breed;
	
	@NotEmpty
	private String gender;
	
	@NotNull
	private int weight;
	
	@Past
	@DateTimeFormat(pattern="yyy-MM-dd")
	private Date birthday;
	
	@NotEmpty
	private String color;
	
	@NotEmpty
	private String size;
	
	@NotEmpty
	private String neutered;
	
	@NotNull
	private int microchip;
	
	@NotEmpty
	private String description;

	@NotEmpty
	private String behavior;
	
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	    
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User owner;
	
	@OneToOne(mappedBy="pet", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private MissingPet missingpet;
	
	public String getBirthdayFormatted() {
		SimpleDateFormat df = new SimpleDateFormat("MMMM dd, yyy");
		return df.format(this.birthday);
	}
	
	public Pet() {
		
	}
	
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getNeutered() {
		return neutered;
	}

	public void setNeutered(String neutered) {
		this.neutered = neutered;
	}

	public int getMicrochip() {
		return microchip;
	}

	public void setMicrochip(int microchip) {
		this.microchip = microchip;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBehavior() {
		return behavior;
	}

	public void setBehavior(String behavior) {
		this.behavior = behavior;
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

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
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
