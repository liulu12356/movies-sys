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
@TableName("schedule")
public class Schedule {

    @TableId(type = IdType.AUTO)
    private Integer id;
    private Integer movie_id;
    private Date start;
    private Date end;
    private Integer status;

}
