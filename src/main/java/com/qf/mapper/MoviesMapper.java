package com.qf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qf.pojo.Category;
import com.qf.pojo.Movie;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MoviesMapper extends BaseMapper<Movie> {
    List<Movie> findAll();

    Movie findById(Integer id);

    void deleteMovie(Integer id);


    void insertMovie(Movie movie);


    void deleteCategoryByMovies(Integer movieId);

    void updateMovie(Movie movie);

    List<Movie> findByTitle(String title);

    List<Movie> findByCategory(List<Integer> categoryId);

    List<Movie> findByCategoryNoGear(List<Integer> categoryIdList);

    List<Movie> findByTitleNoGear(String s);

    List<Category> findCategoryListByMovie(Integer id);

    Integer findMovieIdBy(String title);

    void insertMovieCategory(@Param("movieId") Integer movieId, @Param("categoryId") Integer categoryId);

    void updateMovieStatus(Integer id);

    void updateStatus(Integer id);

    List<Movie> findMovieTicket();
}
