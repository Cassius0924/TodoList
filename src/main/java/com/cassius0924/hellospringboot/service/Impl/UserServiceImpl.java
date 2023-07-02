package com.cassius0924.hellospringboot.service.Impl;

import com.cassius0924.hellospringboot.dao.UserDao;
import com.cassius0924.hellospringboot.model.User;
import com.cassius0924.hellospringboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <b>Date 2023/6/30</b>
 *
 * @author HoChihchou
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public void add(User user) {
        userDao.insertUser(user);
    }

    @Override
    public void removeById(Integer id) {
        userDao.deleteUserById(id);
    }

    @Override
    public Integer getIdByUsername(String username) {
        return userDao.selectIdByUsername(username);
    }

    @Override
    public String getUsernameById(Integer id) {
        return userDao.selectUsernameById(id);
    }

    @Override
    public boolean login(String username, String password) {
        if (password.equals(userDao.selectPasswordByUsername(username))) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean register(String username, String password) {
        if (userDao.selectIdByUsername(username) == null) {
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            userDao.insertUser(user);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void editPassword(Integer id, String password) {
        userDao.updatePassword(id, password);
    }
}
