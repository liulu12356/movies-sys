package com.qf.serviceImpl;

import com.qf.mapper.CategoryMapper;
import com.qf.mapper.MoviesMapper;
import com.qf.pojo.Category;
import com.qf.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryMapper categoryMapper;
    @Autowired
    MoviesMapper moviesMapper;


    @Override
    public List<Category> findAll() {
        return categoryMapper.findAll();
    }

    @Override
    public Category findById(Integer id) {

        return categoryMapper.findById(id);
    }

    @Override
    public void insertCategory() {
        categoryMapper.insertCategory();
    }

    @Override
    public void deleteCategory() {


        categoryMapper.deleteCategory();
    }
}
