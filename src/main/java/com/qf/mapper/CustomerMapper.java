package com.qf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qf.pojo.Movie;
import com.qf.pojo.Schedule;
import com.qf.pojo.Ticket;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerMapper extends BaseMapper<Object> {

    List<Movie> findMovieByStatus();

    List<Ticket> findTicketBySid(Integer scheduleId);

    void updateTicket(@Param("tid") int ticketId,@Param("userId") Integer userId,@Param("version") Integer version);

    Integer findVersionByTid(int ticketId);

    List<Schedule> findScheduleTicket(Integer movieId);
}
