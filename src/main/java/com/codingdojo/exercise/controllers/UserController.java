package com.codingdojo.exercise.controllers;

import java.security.Principal;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.exercise.models.Group;
import com.codingdojo.exercise.models.User;
import com.codingdojo.exercise.services.UserService;

@Controller
public class UserController {
	private UserService uS;
	
	public UserController(UserService uS) {
		this.uS=uS;
	}
 
 
 @PostMapping("/registration")
 public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
     
	 if (result.hasErrors()) {
         return "logReg.jsp";
     }
     if(uS.findByUsername(user.getUsername())!= null) {
    	 model.addAttribute("emailError","User with this email already exists.");
    	 return "logReg.jsp";
     }
     
     uS.saveUserWithAdminRole(user);
     return "redirect:/home";
 }
 
 @RequestMapping("/login")
 public String login(@Valid @ModelAttribute("user") User user, BindingResult result, @RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
     if(error != null) {
         model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
     }
     if(logout != null) {
         model.addAttribute("logoutMessage", "Logout Successful!");
     }
     return "login.jsp";
 }
 
 @RequestMapping(value = {"/", "/home"})
 public String home(Model model) {
	 return "home.jsp";
 }
 
 @RequestMapping(value = "/registration")
 public String register(Model model) {
	 return "logReg.jsp";
 }
 
 @RequestMapping("/admin")
 public String adminPage(Principal principal, Model model) {
     String username = principal.getName();
     model.addAttribute("currentUser", uS.findByUsername(username));
     return "adminPage.jsp";
 }
 
 @RequestMapping("/about")
 public String about(Model model) {
	 return "about.jsp";
 }
}