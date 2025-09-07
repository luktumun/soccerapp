package com.soccer.controller;

import com.soccer.model.User;
import com.soccer.repository.EventRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class PageController {

    // Landing page → index.jsp
    @GetMapping("/")
    public String showLandingPage(@RequestParam(required = false) String error, Model model) {
        model.addAttribute("error", error); // optional error for login feedback
        return "index"; // /WEB-INF/jsp/index.jsp
    }
    @GetMapping("/login")
    public String showLoginPage(@RequestParam(required = false) String error, Model model) {
        model.addAttribute("error", error);
        return "login"; // JSP: /WEB-INF/jsp/login.jsp
    }
    @GetMapping("/logout")
public String handleLogout(HttpSession session) {
    session.invalidate(); // Clear session
    return "redirect:/login?logout=true";
}
   

    // Registration page → register.jsp
    @GetMapping("/register")
    public String showRegisterPage(@RequestParam(required = false) String error, Model model) {
        model.addAttribute("error", error);
        return "register";
    }

    // Forgot password page → forgotpassword.jsp
    @GetMapping("/forgotpassword")
    public String showForgotPasswordPage() {
        return "forgotpassword";
    }



    // Welcome page → welcome.jsp (requires session user)
 @Autowired
private EventRepository eventRepository;

@GetMapping("/welcome")
public String showWelcomePage(HttpSession session, Model model) {
    User user = (User) session.getAttribute("user");
    if (user == null) {
        return "redirect:/login";
    }

    model.addAttribute("user", user);
    model.addAttribute("events", eventRepository.findAll());
    return "welcome";
}

 
 

    // Verification page → verify.jsp
    @GetMapping("/verify")
    public String showVerifyPage() {
        return "verify";
    }
}