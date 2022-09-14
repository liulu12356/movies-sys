package com.qf.mapper;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.qf.pojo.Category;

import java.util.List;

public interface CategoryMapper {

    List<Category> findAll();

    Category findById(Integer id);

    void deleteCategory();

    void insertCategory();
}
