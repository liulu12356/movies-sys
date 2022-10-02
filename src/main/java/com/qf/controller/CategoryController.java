package com.qf.controller;

import com.qf.pojo.Category;
import com.qf.service.CategoryService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
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

    @PostMapping("/category")
    void insertCategory(@RequestBody Category category) {
        categoryService.insertCategory(category);
    }

    @PutMapping("/category")
    void updateCategory(@RequestBody Category category) {
        categoryService.updateCategory(category);
    }

    @DeleteMapping("/category/{id}")
    void deleteCategory(@PathVariable("id") Integer id) {
        categoryService.deleteCategory(id);
    }


}
