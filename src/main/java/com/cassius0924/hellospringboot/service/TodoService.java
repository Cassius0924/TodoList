package com.cassius0924.hellospringboot.service;

import com.cassius0924.hellospringboot.model.Todo;

import java.util.List;

/**
 * <b>Date 2023/7/1</b>
 *
 * @author HoChihchou
 */
public interface TodoService {
    public List<Todo> getAll(Integer userId);

    public Todo getById(Integer id);

    public List<Todo> getByTitle(String title, Integer userId);

    public List<Todo> getByChecked(Boolean checked, Integer userId);

    public void add(Todo todo);

    public void edit(Todo todo);

    public void check(Integer id);

    public void remove(Integer id);


}
