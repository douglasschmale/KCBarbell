package com.codingdojo.exercise.models;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;

import com.codingdojo.exercise.models.User;

@Entity
@Table(name="groups")

public class Group {

	 @Id
	 @GeneratedValue
	 private Long id;
	 @Size(min=1,max=255, message="Name can not be blank")
	 private String name;
	 @Size(min=1,max=255, message="Instructor can not be blank")
	 private String instructor;
	 private int signups;
	 private int maxPeople;
	 @DateTimeFormat(pattern="yyyy-MM-dd")
	 private Date time;
	 
	 @ManyToMany(fetch = FetchType.LAZY)
	 @JoinTable(
	     name = "users_groups", 
	     joinColumns = @JoinColumn(name = "groups_id"), 
	     inverseJoinColumns = @JoinColumn(name = "users_id")
	 )
	 private List<User> users;
	 public List<User> getUsers() {
	 	 return users;
	 }
	 public void setUsers(List<User> users) {
		 this.users = users;
	 }
	 
//   Implement future functionality via programming table:
//	 @ManyToMany(fetch = FetchType.LAZY)
//	 @JoinTable(
//	     name = "groups_programs", 
//	     joinColumns = @JoinColumn(name = "groups_id"), 
//	     inverseJoinColumns = @JoinColumn(name = "programs_id")
//	 )
		
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

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}
	
	public int getSignups() {
		return signups;
	}

	public void setSignups(int signups) {
		this.signups = signups;
	}
	public int getMaxPeople() {
		return maxPeople;
	}

	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}

	public Date getTime() {
		return time;
	}
	
	public void setTime(Date time) {
		this.time = time;
	}
	
	public Group() {
	 }
	 
}