package com.cassius0924.hellospringboot.dao;

import com.cassius0924.hellospringboot.model.Todo;

import java.util.List;

/**
 * <b>Date 2023/7/1</b>
 *
 * @author HoChihchou
 */

public interface TodoDao {
    public List<Todo> selectAll(Integer userId);

    public Todo selectById(Integer id);

    public List<Todo> selectByTitle(String title, Integer userId);

    public List<Todo> selectByChecked(Boolean checked, Integer userId);

    public void insertTodo(Todo todo);

    public void updateTodo(Todo todo);

    public void updateTodoChecked(Integer id);

    public void deleteTodoById(Integer id);
}
