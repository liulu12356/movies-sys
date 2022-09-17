package com.qf.controller;

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
        return moviesService.findById(id);
    }

    @GetMapping("/movie/findByTitle/{title}")
    List<Movie> findByTitle(@PathVariable("title") String title) {
        return moviesService.findByTitle("%"+title+"%");
    }

    @GetMapping("/movie/findByCategory/{category}")
    List<Movie> findMovieByCategory(@PathVariable("category") List<Integer> categoryIdList) {
        return moviesService.findByCategory(categoryIdList);
    }

    @PostMapping("/movie")
    String insertMovie(String title, MultipartFile uploadPic,String description,String detail,Integer state) {

        System.out.println(title);
        System.out.println(uploadPic.getContentType());
        System.out.println(uploadPic.getName());
        // file.getBytes() // 具体的以字节流方式体现的文件数据
        System.out.println(uploadPic.getOriginalFilename());
        System.out.println(uploadPic.getSize());
        Movie movie=new Movie(title,description,detail,state);
        try {
        String path = "E:\\myprojects\\movies-sys\\src\\webapp\\adminlte\\images\\" + uploadPic.getOriginalFilename();
        movie.setPath("\\adminlte\\images\\" + uploadPic.getOriginalFilename());
        // 写入磁盘
            writeToDisk(uploadPic, path);
        } catch (Exception e) {
            e.printStackTrace();
        }
        moviesService.insertMovie(movie);
        return  "SaveOK";
    }


    @PutMapping("/movie")
    String updateMovie(@RequestBody Movie Movie) {
        moviesService.updateMovie(Movie);
        return "UpdateOK";
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
