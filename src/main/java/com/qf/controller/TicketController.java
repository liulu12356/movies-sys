package com.qf.controller;


import com.qf.pojo.Movie;
import com.qf.pojo.Schedule;
import com.qf.service.MoviesService;
import com.qf.service.ScheduleService;
import com.qf.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class TicketController {
    final MoviesService moviesService;
    @Autowired
    TicketService ticketService;


    public TicketController(MoviesService moviesService, ScheduleService scheduleService) {
        this.moviesService = moviesService;

    }


    @GetMapping("/ticket")
    List<Movie> findMovieTicket() {
        return moviesService.findMovieTicket();
    }

    @PutMapping("/ticket")
    String updateTicket(@RequestBody Schedule schedule) {
        ticketService.SaveTicket(schedule);
        return "UpdateOK";
    }
}
