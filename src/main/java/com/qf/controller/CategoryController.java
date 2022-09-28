package com.qf.controller;

import com.qf.pojo.Category;
import com.qf.service.CategoryService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class CategoryController {
    final CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/category")
    List<Category> findAll() {
        return categoryService.findAll();
    }


    @GetMapping("/category/{id}")
    Category findById(@PathVariable("id") Integer id) {
        return categoryService.findById(id);
    }

    @GetMapping("/category/findByName/{name}")
    List<Category> findByName(@PathVariable("name") String name) {
        return categoryService.findByName("%"+name+"%");
    }

    @PostMapping("/category")
    String insertCategory(@RequestBody Category category) {
        categoryService.insertCategory(category);
        return "SaveOK";
    }

    @PutMapping("/category")
    String updateCategory(@RequestBody Category category) {
        System.out.println(category);
        categoryService.updateCategory(category);
        return "UpdateOK";
    }

    @DeleteMapping("/category/{id}")
    String deleteCategory(@PathVariable("id") Integer id) {
        categoryService.deleteCategory(id);
        return "OK";
    }


}
