package com.qf.serviceImpl;

import com.qf.mapper.MoviesMapper;
import com.qf.mapper.ScheduleMapper;
import com.qf.pojo.Category;
import com.qf.pojo.Movie;
import com.qf.pojo.Schedule;
import com.qf.service.MoviesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MoviesServiceImpl implements MoviesService {

    @Autowired
    MoviesMapper moviesMapper;
    @Autowired
    ScheduleMapper scheduleMapper;

    @Override
    public List<Movie> findAll() {
        return moviesMapper.findAll();
    }

    @Override
    public Movie findById(Integer id) {
        return moviesMapper.findById(id);
    }

    @Override
    public void insertMovie(Movie movie, List<Integer> categoryIdList) {
        moviesMapper.insertMovie(movie);
        final Integer movieId = moviesMapper.findMovieIdBy(movie.getTitle());
        categoryIdList.forEach((categoryId)-> moviesMapper.insertMovieCategory(movieId,categoryId));
    }

    @Override
    public void deleteMovie(Integer id) {
        moviesMapper.deleteMovie(id);
        moviesMapper.deleteCategoryByMovies(id);
    }

    @Override
    public void updateMovie(Movie movie, List<Integer> categoryIdList) {
        moviesMapper.updateMovie(movie);
        categoryIdList.forEach((categoryId)->{
            moviesMapper.insertMovieCategory(movie.getId(),categoryId);
        });
    }

    @Override
    public List<Movie> findByTitle(String title) {
        return moviesMapper.findByTitle(title);
    }

    @Override
    public List<Movie> findByCategory(List<Integer> categoryId) {
        return moviesMapper.findByCategory(categoryId);
    }

    @Override
    public List<Movie> findByCategoryNoGear(List<Integer> categoryIdList) {
        return moviesMapper.findByCategoryNoGear(categoryIdList);
    }

    @Override
    public List<Movie> findByTitleNoGear(String s) {
        return moviesMapper.findByTitleNoGear(s);
    }

    @Override
    public List<Category> findCategoryListByMovie(Integer id) {
        return moviesMapper.findCategoryListByMovie(id);
    }

    @Override
    public void updateStatus(Integer id) {
        moviesMapper.updateStatus(id);
    }

    @Override
    public List<Movie> findMovieTicket() {
        final List<Movie> movieTicket = moviesMapper.findMovieTicket();
        movieTicket.forEach((movie)->{
            final List<Schedule> scheduleList = scheduleMapper.findScheduleListByMovieId(movie.getId());
            movie.setScheduleList(scheduleList);
        });
        return movieTicket;

    }


}
