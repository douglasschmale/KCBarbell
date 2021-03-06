package com.codingdojo.exercise.repositories;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.exercise.models.User;


@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User findByUsername(String username);
}