package com.qf.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qf.pojo.Schedule;
import com.qf.pojo.Ticket;
import com.qf.service.TicketService;
import com.qf.util.TicketUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qf.mapper.TicketMapper;

import java.util.ArrayList;
import java.util.List;

@Service
public class TicketServiceImpl extends ServiceImpl<TicketMapper,Ticket> implements TicketService  {

    final TicketMapper ticketMapper;

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


}
