package com.qf.service;

import com.qf.pojo.Movie;
import com.qf.pojo.Schedule;
import com.qf.pojo.Ticket;

import java.util.List;

public interface CustomerService {
    List<Movie> findMovieByStatus();

    List<Ticket> findTicketBySid(Integer scheduleId);

    void updateTicket(int ticketId, Integer userId);

    List<Schedule> findScheduleTicket(Integer movieId);
}
