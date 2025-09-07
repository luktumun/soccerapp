package com.soccer.controller;

import com.soccer.model.User;
import com.soccer.repository.UserRepository;
import com.soccer.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
public class RegisterController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EmailService emailService;

    // POST /register → handle registration form submission
    @PostMapping("/register")
    public String handleRegister(@RequestParam String name,
                                 @RequestParam String email,
                                 @RequestParam String password,
                                 Model model) {

        // Check if email already exists
        if (userRepository.findByEmail(email) != null) {
            return "redirect:/register?error=exists";
        }

        // Create new user with verification code
        String userId = email; // using email as userId
        String verificationCode = UUID.randomUUID().toString();
        User user = new User(userId, name, email, password, verificationCode, "user");
        userRepository.save(user);

        // Send verification email
        try {
            String link = "http://localhost:8080/soccerapp/verify/code?code=" + verificationCode;
            String subject = "Verify your account";
            String body = "<p>Hello " + name + ",</p>"
                        + "<p>Thank you for registering Football club</p>" 
                        + "<p>Please click the link below to verify your account:</p>"
                        + "<p><strong>User ID:</strong> " + user.getUserId() + "</p>"
                        + "<p><strong>Password:</strong> " + user.getPassword() + "</p>"
                        + "<p>Please keep this information secure.</p>"
                        + "<a href=\"" + link + "\">Verify Now</a>";
            emailService.sendEmail(email, subject, body);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/register?error=emailFailed";
        }

        return "redirect:/verify";
    }
}