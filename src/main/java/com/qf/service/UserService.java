package com.qf.service;

import com.qf.pojo.User;

public interface UserService {

    User checkLogin(User user);

    void insertUser(User user);


}
