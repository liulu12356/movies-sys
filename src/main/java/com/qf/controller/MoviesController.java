package com.qf.controller;

import com.qf.pojo.Category;
import com.qf.pojo.Movie;
import com.qf.service.MoviesService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@RestController
@Log4j2
public class MoviesController {

    @Autowired
    MoviesService moviesService;


    @GetMapping("/movie")
    List<Movie> findAll() {
        return moviesService.findAll();
    }


    @GetMapping("/movie/{id}")
    Movie findById(@PathVariable("id") Integer id) {
        Movie movie = moviesService.findById(id);
        final List<Category> categoryListByMovie = moviesService.findCategoryListByMovie(id);
        movie.setCategoryList(categoryListByMovie);
        return movie;
    }

    @GetMapping("/movie/findByTitle/{title}")
    List<Movie> findByTitle(@PathVariable("title") String title) {
        return moviesService.findByTitle("%"+title+"%");
    }

    //未排档电影根据标题查询
    @GetMapping("/movie/findByTitle/noGear/{title}")
    List<Movie> findByTitleNoGear(@PathVariable("title") String title) {
        return moviesService.findByTitleNoGear("%"+title+"%");
    }

    @GetMapping("/movie/findByCategory/{categoryId}")
    List<Movie> findMovieByCategory(@PathVariable("categoryId") List<Integer> categoryIdList) {
        return moviesService.findByCategory(categoryIdList);
    }

    //未排档电影根据类别查询
    @GetMapping("/movie/findByCategory/noGear/{categoryId}")
    List<Movie> findMovieByCategoryNoGear(@PathVariable("categoryId") List<Integer> categoryIdList) {
        return moviesService.findByCategoryNoGear(categoryIdList);
    }

    @PostMapping("/movie")
    String insertMovie(String title, MultipartFile uploadPic,String description,String detail,Integer state,@RequestParam("categoryIdList") List<Integer> categoryIdList) {
        Movie movie=new Movie(title,description,detail,state);
        //新增中间表的数据

        try {
        String path = "E:\\myprojects\\movies-sys\\src\\webapp\\adminlte\\images\\" + uploadPic.getOriginalFilename();
        movie.setPath("\\adminlte\\images\\" + uploadPic.getOriginalFilename());
        // 写入磁盘
            writeToDisk(uploadPic, path);
        } catch (Exception e) {
            e.printStackTrace();
        }
        moviesService.insertMovie(movie,categoryIdList);
        return  "SaveOK";
    }


    @PutMapping("/movie")
    String updateMovie(@RequestBody Movie movie) {
        moviesService.updateMovie(movie,movie.getCategoryIdList());
        return "UpdateOK";
    }

    @GetMapping("/movie/updateStatus/{id}")
    void updateStatus(@PathVariable("id") Integer id){
        System.out.println(id);
        moviesService.updateStatus(id);
    }

    @DeleteMapping("/movie/{id}")
    String deleteMovie(@PathVariable("id") Integer id) {
        moviesService.deleteMovie(id);
        return "OK";

    }

    private void writeToDisk(MultipartFile uploadPic, String path) throws IOException {
        File dest = new File(path);
        uploadPic.transferTo(dest);
    }

}
