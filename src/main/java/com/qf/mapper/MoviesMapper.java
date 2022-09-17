package com.qf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qf.pojo.Movie;

import java.util.List;

public interface MoviesMapper extends BaseMapper<Movie> {
    List<Movie> findAll();

    Movie findById(Integer id);

    void deleteMovie(Integer id);


    void insertMovie(Movie movie);


    void deleteCategoryByMovies(Integer categoryId);

    void updateMovie(Movie movie);

    List<Movie> findByTitle(String title);

    List<Movie> findByCategory(List<Integer> categoryId);
}
