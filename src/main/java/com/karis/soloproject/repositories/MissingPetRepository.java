package com.karis.soloproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.karis.soloproject.models.MissingPet;

@Repository
public interface MissingPetRepository extends CrudRepository<MissingPet,Long> {
	List<MissingPet> findAll();
	List<MissingPet> findByState(String state);
}
