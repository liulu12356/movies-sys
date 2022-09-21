package com.qf.service;

import com.qf.pojo.Movie;
import com.qf.pojo.Schedule;

import java.util.List;

public interface ScheduleService {

    //查询未排挡的电影列表
    List<Movie> findMoviesNoGear();


    List<Schedule> findScheduleByMovie(Integer id);

    void deleteSchedule(Integer id);

    void insertSchedule(Schedule schedule);

    Schedule findScheduleById(Integer scheduleId);
}
