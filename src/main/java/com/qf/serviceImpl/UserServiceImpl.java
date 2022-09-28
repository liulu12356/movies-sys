package com.qf.serviceImpl;

import com.qf.mapper.UserMapper;
import com.qf.pojo.User;
import com.qf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public User checkLogin(User user) {
        return userMapper.checkLogin(user);
    }

    @Override
    public void insertUser(User user) {

    }

}
