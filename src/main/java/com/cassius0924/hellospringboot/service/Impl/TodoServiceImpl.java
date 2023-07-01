package com.cassius0924.hellospringboot.service.Impl;

import com.cassius0924.hellospringboot.dao.TodoDao;
import com.cassius0924.hellospringboot.model.Todo;
import com.cassius0924.hellospringboot.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <b>Date 2023/7/1</b>
 *
 * @author HoChihchou
 */
@Service
public class TodoServiceImpl implements TodoService {
    @Autowired
    private TodoDao todoDao;

    @Override
    public List<Todo> getAll(Integer userId) {
        return todoDao.selectAll(userId);
    }

    @Override
    public Todo getById(Integer id) {
        return todoDao.selectById(id);
    }

    @Override
    public List<Todo> getByTitle(String title, Integer userId) {
        return todoDao.selectByTitle(title, userId);
    }

    @Override
    public List<Todo> getByChecked(Boolean checked, Integer userId) {
        return todoDao.selectByChecked(checked, userId);
    }

    @Override
    public void add(Todo todo) {
        todoDao.insertTodo(todo);
    }

    @Override
    public void edit(Todo todo) {
        todoDao.updateTodo(todo);
    }

    @Override
    public void check(Integer id) {
        todoDao.updateTodoChecked(id);
    }

    @Override
    public void remove(Integer id) {
        todoDao.deleteTodoById(id);
    }
}
