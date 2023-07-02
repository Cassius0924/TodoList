package com.cassius0924.hellospringboot.dao;

import com.cassius0924.hellospringboot.model.User;

import java.util.List;

/**
 * <b>Date 2023/6/30</b>
 *
 * @author HoChihchou
 */
public interface UserDao {
//    public List<User> selectAll();
//    public List<User> selectByName(String username);
    public void insertUser(User user);
    public void deleteUserById(Integer id);
    public String selectPasswordByUsername(String username);
    public Integer selectIdByUsername(String username);
    public String selectUsernameById(Integer id);
    public void updatePassword(Integer id, String password);
}