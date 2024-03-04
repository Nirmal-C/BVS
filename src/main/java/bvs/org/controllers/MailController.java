/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.controllers;

import bvs.org.config.PasswordMail;
import bvs.org.config.UserMail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Mail")

public class MailController {

    @PostMapping("/submitUser")
    public String submitUser(@RequestBody Map<String, String> requestData) {
        String email = requestData.get("email");
        String username = requestData.get("username");
        String password = requestData.get("password");

        // Send an email containing the user's credentials
        boolean mailSent = UserMail.sendUserCredentials(email, "User Credentials", "Username: " + username + "<br>Password: " + password);

        if (mailSent) {
            return "User credentials sent successfully!";
        } else {
            return "Failed to send user credentials. Please try again.";
        }
    }

    @PostMapping("/sendotp")
    public String sendOtp(@RequestBody Map<String, String> requestData) {
        String email = requestData.get("email");
        String otpCode = requestData.get("otpCode");

        if (email == null || otpCode == null) {
            return "Email or OTP code missing";
        }

        boolean sent = PasswordMail.sendOtp(email, otpCode);
        if (sent) {
            return "OTP sent successfully to " + email;
        } else {
            return "Failed to send OTP to " + email;
        }
    }
}
