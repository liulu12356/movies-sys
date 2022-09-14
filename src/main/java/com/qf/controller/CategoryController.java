package com.qf.controller;

import com.qf.pojo.Category;
import com.qf.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CategoryController {
    @Autowired
    CategoryService categoryService;
    @GetMapping("/category")
    List<Category> findAll(){
        return categoryService.findAll();
    }


    @GetMapping("/category/{id}")
    Category findById(@PathVariable("id") Integer id){
        return categoryService.findById(id);
    }

}
