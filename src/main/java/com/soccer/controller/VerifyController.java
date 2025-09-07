package com.soccer.controller;

import com.soccer.model.User;
import com.soccer.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class VerifyController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/verify/code")
    public String handleVerify(@RequestParam(required = false) String code) {
        if (code == null || code.isEmpty()) {
            return "redirect:/verify?status=missing";
        }
    
        User user = userRepository.findByVerificationCode(code); // ✅ fixed method name
        if (user != null) {
            user.setVerified(true);
            userRepository.save(user);
            return "redirect:/verify?status=verified";
        } else {
            return "redirect:/verify?status=invalid";
        }
    }
}