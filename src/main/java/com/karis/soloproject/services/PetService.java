package com.karis.soloproject.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.karis.soloproject.models.Message;
import com.karis.soloproject.models.MissingPet;
import com.karis.soloproject.models.Pet;
import com.karis.soloproject.models.User;
import com.karis.soloproject.repositories.MessageRepository;
import com.karis.soloproject.repositories.MissingPetRepository;
import com.karis.soloproject.repositories.PetRepository;

@Service
public class PetService {

	@Autowired
	private PetRepository petRepository;
	
	@Autowired
	private MissingPetRepository missingRepository; 
	
	@Autowired
	private MessageRepository messageRepository;
	
	//List All Pets
	public List<Pet> allPets(){
		return petRepository.findAll();
	}
	
	//List of Pets by State
//	public List<Pet> findPetByState(String state){
//		return petRepository.findByState(state);
//	}
//	
	//Get one Pet
	public Pet findPet(Long id) {
		return petRepository.findById(id).orElse(null);
	}
	
	//Create New Pet
	public Pet createPet(Pet pet) {
		return petRepository.save(pet);
	}
	
	//Delete Pet
	public void deletePet(Long id) {
		petRepository.deleteById(id);
	}
	
	//Update Pet 
	public Pet updatePet(Pet pet) {
		return petRepository.save(pet);
	}
	
	//*************** Missing Pet *******************
	
	//List All Missing Pets
	public List<MissingPet> allMissing(){
		return missingRepository.findAll();
	}
	
	//List of Missing Pets by State
	public List<MissingPet> findPetByState(String state){
		return missingRepository.findByState(state);
	}
	
	//Get One Missing Pet
	public MissingPet getMissingPet(Long id) {
		return missingRepository.findById(id).orElse(null);
	}
	
	//Create New Missing Pet
	public MissingPet createMissingPet(MissingPet missingPet) {
		return missingRepository.save(missingPet);
	}
	
	//Delete Missing Pet
	public void deleteMissingPet(Long id) {
		missingRepository.deleteById(id);
	}
	
	//Update Missing Pet
	public MissingPet updateMissingPet(MissingPet missingPet) {
		return missingRepository.save(missingPet);
	}
	
	//*************** Message *******************
	
	//comment message on Pet
	public void comment(User user, Pet pet, String message) {
		messageRepository.save(new Message(message,user,pet));
	}
}
