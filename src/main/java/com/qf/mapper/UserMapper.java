package com.qf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qf.pojo.User;

public interface UserMapper extends BaseMapper<User> {

    User checkLogin(User user);
}
