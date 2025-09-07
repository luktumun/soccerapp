package com.soccer.controller;

import com.soccer.model.Event;
import com.soccer.repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private EventRepository eventRepository;

    @PostMapping("/event/upload")
    public String uploadEvent(@RequestParam String title,
                              @RequestParam Date eventDate,
                              @RequestParam String details) {
        Event event = new Event(title, eventDate, details);
        eventRepository.save(event);
        return "redirect:/welcome";
    }
}