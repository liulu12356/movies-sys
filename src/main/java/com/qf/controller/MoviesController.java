package com.qf.controller;

import com.qf.pojo.Movie;
import com.qf.service.MoviesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class MoviesController {

    @Autowired
    MoviesService moviesService;


    @GetMapping("/movie")
    List<Movie> findAll() {
        return moviesService.findAll();
    }


    @GetMapping("/movie/{id}")
    Movie findById(@PathVariable("id") Integer id) {
        return moviesService.findById(id);
    }

    @PostMapping("/movie")
    void insertMovie(@RequestBody Movie Movie) {
        moviesService.insertMovie(Movie);
    }

    @PutMapping("/movie")
    void updateMovie(@RequestBody Movie Movie) {
        moviesService.updateMovie(Movie);
    }

    @DeleteMapping("/movie/{id}")
    void deleteMovie(@PathVariable("id") Integer id) {
        moviesService.deleteMovie(id);
    }


}
