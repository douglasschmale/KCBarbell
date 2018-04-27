package com.codingdojo.exercise.services;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.codingdojo.exercise.models.User;
import com.codingdojo.exercise.repositories.RoleRepository;
import com.codingdojo.exercise.repositories.UserRepository;

@Service
public class UserService {
    private UserRepository userRepository;
    private RoleRepository roleRepository;
    private BCryptPasswordEncoder bcrypt;
    
    public UserService(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder)     {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bcrypt = bCryptPasswordEncoder;
    }
    

    public void saveWithUserRole(User user) {
        user.setPassword(bcrypt.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_USER"));
        userRepository.save(user);
    }
     
    public void saveUserWithAdminRole(User user) {
        user.setPassword(bcrypt.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
        userRepository.save(user);
    }    
    
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
}

