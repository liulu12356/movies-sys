package com.qf.serviceImpl;

import com.qf.mapper.MoviesMapper;
import com.qf.pojo.Movie;
import com.qf.service.MoviesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MoviesServiceImpl implements MoviesService {

    @Autowired
    MoviesMapper moviesMapper;

    @Override
    public List<Movie> findAll() {
        return moviesMapper.findAll();
    }

    @Override
    public Movie findById(Integer id) {
        return moviesMapper.findById(id);
    }

    @Override
    public void insertMovie(Movie movie) {
        moviesMapper.insertMovie(movie);
    }

    @Override
    public void deleteMovie(Integer id) {
        moviesMapper.deleteMovie(id);
        moviesMapper.deleteCategoryByMovies(id);
    }

    @Override
    public void updateMovie(Movie movie) {
        moviesMapper.updateMovie(movie);
    }
}
