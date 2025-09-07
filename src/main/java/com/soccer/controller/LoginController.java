package com.soccer.controller;

import com.soccer.model.User;
import com.soccer.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/login")
    public String handleLogin(@RequestParam String userId,
                              @RequestParam String password,
                              HttpSession session) {

        User user = userRepository.findByUserId(userId);

        if (user == null || !user.getPassword().equals(password)) {
            return "redirect:/login?error=invalid";
        }

        if (!user.isVerified()) {
            return "redirect:/login?error=notVerified";
        }

        // Login successful → store user in session
        session.setAttribute("user", user);
        return "redirect:/welcome";
    }
}