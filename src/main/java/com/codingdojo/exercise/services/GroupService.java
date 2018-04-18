package com.codingdojo.exercise.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.exercise.models.Group;
import com.codingdojo.exercise.repositories.GroupRepository;

@Service
public class GroupService {

	private GroupRepository gR;
	
	public GroupService(GroupRepository gR) {
		this.gR = gR;
	}
	
	public void create(Group newGroup) {
		gR.save(newGroup);
	}
	
	public ArrayList<Group> all(){
		return (ArrayList<Group>) gR.findAll();
	}
	
	public Group find(Long id) {
		return gR.findById(id).orElse(null);
	}
	
	public void update(Group thisGroup) {
		gR.save(thisGroup);
	}
	
	public void destroy(Group group) {
		gR.delete(group);
	}
}

