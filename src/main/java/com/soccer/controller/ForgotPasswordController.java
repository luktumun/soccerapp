package com.soccer.controller;

import com.soccer.model.User;
import com.soccer.repository.UserRepository;
import com.soccer.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class ForgotPasswordController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EmailService emailService;
    @PostMapping("/forgotpassword")
    public String handleForgot(@RequestParam String email) {
        User user = userRepository.findByEmail(email);
        if (user != null) {
            String subject = "Your Login Credentials";
            String body = "<p>Hello " + user.getName() + ",</p>"
                        + "<p>Here are your login details:</p>"
                        + "<p><strong>User ID:</strong> " + user.getUserId() + "</p>"
                        + "<p><strong>Password:</strong> " + user.getPassword() + "</p>"
                        + "<p>Please keep this information secure.</p>";
    
            try {
                emailService.sendEmail(email, subject, body);
                return "redirect:/forgotpassword?status=sent";
            } catch (Exception e) {
                e.printStackTrace();
                return "redirect:/forgotpassword?status=error";
            }
        }
    
        return "redirect:/forgotpassword?status=error";
    }
}