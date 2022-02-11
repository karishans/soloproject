package com.karis.soloproject.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.karis.soloproject.models.User;

@Repository
public interface UserRepository extends CrudRepository<User,Long>{
	User findByEmail(String email);
}
