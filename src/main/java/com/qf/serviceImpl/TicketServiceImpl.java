package com.qf.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qf.mapper.ScheduleMapper;
import com.qf.pojo.Movie;
import com.qf.pojo.Schedule;
import com.qf.pojo.Ticket;
import com.qf.service.TicketService;
import com.qf.util.TicketUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qf.mapper.TicketMapper;

import java.util.List;

@Service
public class TicketServiceImpl extends ServiceImpl<TicketMapper,Ticket> implements TicketService  {

    final TicketMapper ticketMapper;
    @Autowired
    ScheduleMapper scheduleMapper;

    public TicketServiceImpl(TicketMapper ticketMapper) {
        this.ticketMapper = ticketMapper;
    }


    @Override
    public void SaveTicket(Schedule schedule) {
        //初始化若干ticket
        final List<Ticket> ticketList = TicketUtil.createTicket(4, 10, schedule.getMovieId(), schedule.getId());
        //批量插入
        saveBatch(ticketList);
        ticketMapper.updateSchedule(schedule.getId());
    }

    @Override
    public List<Movie> findMovieByTitle(String title) {
        final List<Movie> movieTicket = ticketMapper.findMovieTicketByTitle("%"+title+"%");
        movieTicket.forEach((movie)->{
            final List<Schedule> scheduleList = scheduleMapper.findScheduleListByMovieId(movie.getId());
            movie.setScheduleList(scheduleList);
        });
        return movieTicket;
    }


}
