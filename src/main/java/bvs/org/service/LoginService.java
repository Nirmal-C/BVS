/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.service;

import bvs.org.model.User;
import bvs.org.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    UserRepo userRepo;

    public User checkLogin(String username, String password) {

        User user = userRepo.findByUsername(username).orElse(null);

        if (user != null && user.getPassword().equals(password)) {
            return user;
        } else {
            return null;
        }
    }

    public User checkUser(String username) {

        User user = userRepo.findByUsername(username).orElse(null);

        if (user != null && user.getUsername().equals(username)) {
            return user;
        } else {
            return null;
        }
    }

    public void updatePassword(String username, String newPassword) {
        // Retrieve the user from the database
        User user = userRepo.findByUsername(username).orElse(null);

        if (user != null) {

            user.setPassword(newPassword);

            // Save the updated user to the database
            userRepo.save(user);
        } else {
            // Handle the case where the user is not found in the database
            // You may throw an exception, log a message, or perform any other appropriate action
        }
    }

}
