package com.codingdojo.exercise.repositories;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.exercise.models.Group;

@Repository
public interface GroupRepository extends CrudRepository<Group, Long> {
//	ArrayList<Group> findByName(String name);


}