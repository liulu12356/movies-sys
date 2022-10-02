package com.qf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qf.pojo.Category;

import java.util.List;

public interface CategoryMapper extends BaseMapper<Category> {

    List<Category> findAll();

    Category findById(Integer id);

    void deleteCategory(Integer id);

    void insertCategory(Category category);

    void updateCategory(Category category);

    void deleteMovieByCategory(Integer category);


}
