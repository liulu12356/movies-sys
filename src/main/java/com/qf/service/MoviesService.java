package com.qf.service;

import com.qf.pojo.Category;
import com.qf.pojo.Movie;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MoviesService {

    List<Movie> findAll();

    Movie findById(Integer id);

    void insertMovie(Movie movie, List<Integer> categoryIdList);

    void deleteMovie(Integer id);

    void updateMovie(Movie movie, List<Integer> categoryList);

    List<Movie> findByTitle(String title);

    List<Movie> findByCategory(List<Integer> categoryId);

    List<Movie> findByCategoryNoGear(List<Integer> categoryIdList);

    List<Movie> findByTitleNoGear(String s);

    List<Category> findCategoryListByMovie(Integer id);

    void updateStatus(Integer id);

    List<Movie> findMovieTicket();
}
