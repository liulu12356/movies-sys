package com.qf.controller;

import com.qf.pojo.Movie;
import com.qf.pojo.Schedule;
import com.qf.pojo.Ticket;
import com.qf.service.CustomerService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CustomerController {


    final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping("/customerMovie")
    List<Movie> findMovieByStatus(){
        return customerService.findMovieByStatus();
    }

    @GetMapping("/customer/schedule/{mid}")
    List<Schedule> findScheduleTicket(@PathVariable("mid") Integer movieId){
        return  customerService.findScheduleTicket(movieId);
    }

    @GetMapping("/ticket/{scheduleId}")
    List<Ticket> findTicketBySid(@PathVariable("scheduleId") Integer scheduleId){
       return  customerService.findTicketBySid(scheduleId);
    }

    @PostMapping("/ticket/buy/{ticketIdList}")
    String BuyTicket(@PathVariable("ticketIdList") int [] ticketIdList
            ,@RequestParam("userId") Integer userId){
        System.out.println(userId);
        for (int i = 0; i < ticketIdList.length; i++) {
            customerService.updateTicket(ticketIdList[i],userId);
        }
        return "BuyOK";
    }
}
