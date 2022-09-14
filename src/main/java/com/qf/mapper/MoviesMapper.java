package com.qf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qf.pojo.Movie;

import java.util.List;

public interface MoviesMapper extends BaseMapper<Movie> {
    List<Movie> findAll();

    Movie findById(Integer id);

    void deleteMovie();

    void insertMovie();
}
