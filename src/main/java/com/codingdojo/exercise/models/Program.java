package com.codingdojo.exercise.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name="programs")

public class Program {

	 @Id
	 @GeneratedValue
	 private Long id;
	 @Size(min=1,max=255, message="Name can not be blank")
	 private String name;
	 private String strength;
	 private String looks;
	 private String movement;
	 
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "groups_programs", 
        joinColumns = @JoinColumn(name = "programs_id"), 
        inverseJoinColumns = @JoinColumn(name = "group_id")
    )
	
    private List<Group> groups;
	
	public List<Group> getGroups() {
		return groups;
	}
	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}
		
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
//	public List<String> getExercises() {
//		return exercises;
//	}
//	public void setExercises(List<String> exercises) {
//		this.exercises = exercises;
//	}
}