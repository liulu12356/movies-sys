package com.qf.service;

import com.qf.pojo.Category;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CategoryService {

    List<Category> findAll();

    Category findById(Integer id);

    void insertCategory(Category category);

    void deleteCategory(Integer id);

    void updateCategory(Category category);
}
