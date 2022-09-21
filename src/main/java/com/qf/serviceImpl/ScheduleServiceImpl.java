package com.qf.serviceImpl;

import com.qf.mapper.MoviesMapper;
import com.qf.mapper.ScheduleMapper;
import com.qf.pojo.Movie;
import com.qf.pojo.Schedule;
import com.qf.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService {

    final ScheduleMapper scheduleMapper;
    final MoviesMapper moviesMapper;

    public ScheduleServiceImpl(ScheduleMapper scheduleMapper, MoviesMapper moviesMapper) {
        this.scheduleMapper = scheduleMapper;
        this.moviesMapper = moviesMapper;
    }

    @Override
    public List<Movie> findMoviesNoGear() {
        return scheduleMapper.findScheduleMovie();
    }

    @Override
    public List<Schedule> findScheduleByMovie(Integer id) {
        return scheduleMapper.findScheduleListByMovieId(id);
    }

    @Override
    public void deleteSchedule(Integer id) {
        scheduleMapper.delete(id);
    }

    @Override
    public void insertSchedule(Schedule schedule) {
        scheduleMapper.save(schedule);
        moviesMapper.updateMovieStatus(schedule.getMovieId());
    }

    @Override
    public Schedule findScheduleById(Integer scheduleId) {
        return scheduleMapper.findScheduleById(scheduleId);
    }
}
