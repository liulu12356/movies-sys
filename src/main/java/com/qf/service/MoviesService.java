package com.qf.service;

import com.qf.pojo.Movie;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MoviesService {

    List<Movie> findAll();

    Movie findById(Integer id);

    void insertMovie(Movie movie);

    void deleteMovie(Integer id);

    void updateMovie(Movie movie);
}
