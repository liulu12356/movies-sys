package com.qf.controller;

import com.qf.pojo.Movie;
import com.qf.pojo.Schedule;
import com.qf.service.ScheduleService;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
public class ScheduleController {
    @Autowired
    ScheduleService scheduleService;


    @GetMapping("/movie/noGear")
    List<Movie> findMoviesNoGear(){
        return scheduleService.findMoviesNoGear();
    }

    @GetMapping("/schedule/{movieId}")
    List<Schedule> findScheduleByMovie(@PathVariable("movieId") Integer id){
        return scheduleService.findScheduleByMovie(id);
    }

    @GetMapping("/schedule/ticket/{scheduleId}")
    Schedule findScheduleById(@PathVariable Integer scheduleId){
        return scheduleService.findScheduleById(scheduleId);
    }

    @DeleteMapping("/schedule/{id}")
    String deleteSchedule(@PathVariable("id") Integer id){
        scheduleService.deleteSchedule(id);
        return "OK";
    }

    @PostMapping("/schedule")
    String insertSchedule(@RequestBody Schedule schedule){
        System.out.println(schedule);
        scheduleService.insertSchedule(schedule);
        return "SaveOK";
    }



}
