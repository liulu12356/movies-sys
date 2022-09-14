package com.qf.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("movies")
public class Movie {

    @TableId(type = IdType.AUTO)
    private Integer id;
    private String title;
    private String description;
    private String detail;
    private String path;
    private String state;
    private Date createdTime;
    private Date modifiedTime;

}
