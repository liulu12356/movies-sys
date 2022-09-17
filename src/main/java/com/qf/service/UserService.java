package com.qf.service;

import com.qf.pojo.User;

public interface UserService {

    String checkLogin(User user);

    void insertUser(User user);


}
