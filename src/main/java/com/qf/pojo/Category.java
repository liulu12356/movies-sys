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
@TableName("category")
public class Category {

    @TableId(type = IdType.AUTO)
    private Integer id;
    private String name;
    private String comment;
    private String state;
    private String createdTime;
    private String modifiedTime;

}
