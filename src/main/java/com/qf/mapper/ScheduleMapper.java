package com.qf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qf.pojo.Movie;
import com.qf.pojo.Schedule;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScheduleMapper extends BaseMapper<Schedule> {
    List<Movie> findScheduleMovie();

    List<Schedule> findScheduleListByMovieId(Integer id);

    void save(Schedule schedule);

    void delete(Integer id);

    void updateStatus(@Param("id") Integer id, @Param("status") Integer status);

    Schedule findScheduleById(Integer scheduleId);
}
