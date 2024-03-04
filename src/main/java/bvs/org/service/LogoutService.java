/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.service;

import bvs.org.repo.UserRepo;
import bvs.org.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogoutService {

    @Autowired
    UserRepo UserRepo;

    public User Logout(String username) {
        return UserRepo.findByUsername(username).orElse(null);
    }

}
