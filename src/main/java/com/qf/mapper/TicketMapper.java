package com.qf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qf.pojo.Movie;
import com.qf.pojo.Ticket;

import java.util.List;

public interface TicketMapper extends BaseMapper<Ticket> {


    void updateSchedule(Integer id);

    void insertTicket();

    List<Movie> findMovieTicketByTitle(String title);
}
