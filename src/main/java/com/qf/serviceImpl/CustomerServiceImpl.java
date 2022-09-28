package com.qf.serviceImpl;

import com.qf.mapper.CustomerMapper;
import com.qf.pojo.Movie;
import com.qf.pojo.Schedule;
import com.qf.pojo.Ticket;
import com.qf.service.CustomerService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
    final CustomerMapper customerMapper;

    public CustomerServiceImpl(CustomerMapper customerMapper) {
        this.customerMapper = customerMapper;
    }

    @Override
    public List<Movie> findMovieByStatus() {
        return customerMapper.findMovieByStatus();
    }

    @Override
    public List<Ticket> findTicketBySid(Integer scheduleId) {
        return customerMapper.findTicketBySid(scheduleId);
    }

    @Override
    public void updateTicket(int ticketId, Integer userId) {
        final Integer versionByTid = customerMapper.findVersionByTid(ticketId);
        customerMapper.updateTicket(ticketId,userId,versionByTid);
    }

    @Override
    public List<Schedule> findScheduleTicket(Integer movieId) {
        return customerMapper.findScheduleTicket(movieId);
    }
}
