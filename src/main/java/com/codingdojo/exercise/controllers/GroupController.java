package com.codingdojo.exercise.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.exercise.models.Group;
import com.codingdojo.exercise.models.User;
import com.codingdojo.exercise.repositories.UserRepository;
import com.codingdojo.exercise.controllers.UserController;
import com.codingdojo.exercise.services.GroupService;
import com.codingdojo.exercise.services.UserService;

@Controller 
@RequestMapping("/groups")
public class GroupController {
	private GroupService gS;
	private UserService uS;
	
	public GroupController(GroupService gS) {
		this.gS=gS;
	}
	
	@RequestMapping("")
	public String groups(Principal principal, @ModelAttribute("group") Group group, Model model) {
		ArrayList<Group> groups = gS.all();
		model.addAttribute("groups", groups);
//		String username = (principal.getName());
//	    model.addAttribute("currentUser", uS.findByUsername(username).getUsername());
//	    System.out.println(uS.findByUsername(username).getUsername());
		return "groups.jsp";
	}
	
	@PostMapping("/new")
	public String create(@Valid @ModelAttribute("group") Group newGroup, BindingResult res) {
		if(res.hasErrors()) {
			return "newGroup.jsp";
		}
		gS.create(newGroup);
		return "redirect:/groups";	

	}
	
	@RequestMapping("/new")
	public String newGroup(@ModelAttribute("group") Group group) {
		return "newGroup.jsp";
	}
	
//	@PostMapping("/{id}/add")
//	public String addToEvent(@PathVariable("id") long id, Principal principal, Model model) {
//		Group thisGroup = gS.find(id);
//		String currentUser = principal.getName();
////		User principalUser = UserService.findByUsername(currentUser);
////		principalUser.setGroup(thisGroup);
//		return "redirect:/groups/{id}";
//	}
	
	@RequestMapping("/{id}")
	public String showEvent(Principal principal, @PathVariable("id") long id, Model model) {
		
		model.addAttribute("group", (Group)gS.find(id));
		
		return "showGroups.jsp";
	}
	
	@RequestMapping("/{id}/add")
	public String addToEvent(Principal principal, @PathVariable("id") Long group_id, Model model) {
		Group g = (Group)gS.find(group_id);
		
//		String username = principal.getName();

		User u = uS.findByUsername(principal.getName());
		Date d = new Date();
		
		List<User> users = g.getUsers();
		
		users.add(u);
		g.setUsers(users);
		u.setUpdatedAt(d);
		
		int students = g.getSignups();
		students += 1;
		g.setSignups(students);
		
		gS.update(g);
		
		return "redirect:/groups/{id}";
	}
	
}
