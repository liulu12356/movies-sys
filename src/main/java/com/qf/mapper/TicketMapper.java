package com.qf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qf.pojo.Ticket;

public interface TicketMapper extends BaseMapper<Ticket> {


    void updateSchedule(Integer id);

    void insertTicket();
}
