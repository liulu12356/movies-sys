package com.qf.service;

import com.qf.pojo.Movie;
import com.qf.pojo.Schedule;

import java.util.List;

public interface TicketService {

    void SaveTicket(Schedule schedule);

    List<Movie> findMovieByTitle(String title);
}
