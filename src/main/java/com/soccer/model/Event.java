
package com.soccer.model;

import jakarta.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "events")
public class Event {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String title;

    @Column(name = "event_date", nullable = false)
    private Date eventDate;

    @Column(columnDefinition = "TEXT")
    private String details;

    // Constructors
    public Event() {}

    public Event(String title, Date eventDate, String details) {
        this.title = title;
        this.eventDate = eventDate;
        this.details = details;
    }

    public Event(int id, String title, Date eventDate, String details) {
        this.id = id;
        this.title = title;
        this.eventDate = eventDate;
        this.details = details;
    }


    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getEventDate() {
        return eventDate;
    }

    public void setEventDate(Date eventDate) {
        this.eventDate = eventDate;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
}