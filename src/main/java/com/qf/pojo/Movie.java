package com.qf.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("movies")
public class Movie {

    @TableId(type = IdType.AUTO)
    private Integer id;
    private String name;
    private String description;
    private String detail;
    private String path;
    private String state;
    private String createdTime;
    private String modifiedTime;

}
