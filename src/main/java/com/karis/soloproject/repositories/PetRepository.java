package com.karis.soloproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.karis.soloproject.models.Pet;

@Repository
public interface PetRepository extends CrudRepository<Pet,Long> {
	List<Pet> findAll();

}
