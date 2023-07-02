package com.cassius0924.hellospringboot.service;

import com.cassius0924.hellospringboot.model.User;

import java.util.List;

/**
 * <b>Date 2023/6/30</b>
 *
 * @author HoChihchou
 */

// 用户服务层的接口
public interface UserService {
    public void add(User user);
    public void removeById(Integer id);
    public boolean login(String username, String password);
    public Integer getIdByUsername(String username);
    public String getUsernameById(Integer id);
    public boolean register(String username, String password);
    public void editPassword(Integer id, String password);
}