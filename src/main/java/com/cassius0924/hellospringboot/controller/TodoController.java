package com.cassius0924.hellospringboot.controller;

import com.cassius0924.hellospringboot.model.Todo;
import com.cassius0924.hellospringboot.model.User;
import com.cassius0924.hellospringboot.service.TodoService;
import com.cassius0924.hellospringboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;

/**
 * <b>Date 2023/7/1</b>
 *
 * @author HoChihchou
 */
@Controller
public class TodoController {

    @Autowired
    @Qualifier("todoServiceImpl")
    private TodoService todoService;

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping(value = "/todo", method = RequestMethod.GET)
    public ModelAndView todo() {
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("todo_list");
        mav.addObject("todos", todoService.getAll(userId));
        return mav;
    }


    @RequestMapping(value = "/todo/add", method = RequestMethod.POST)
    public ModelAndView addTodo(@RequestParam("title") String title,
                                @RequestParam("detail") String detail,
                                @RequestParam("date") String date,
                                @RequestParam("time") String time,
                                @RequestParam("url") String url) {
        Todo todo = new Todo();
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        todo.setTitle(title);
        todo.setDetail(detail);
        todo.setTime(Timestamp.valueOf(date + " " + time + ":00"));
        todo.setUrl(url);
        todo.setUserId(userId);
        todo.setCreatedTime(new Timestamp(System.currentTimeMillis()));
        todoService.add(todo);
        return new ModelAndView("redirect:/todo");
    }

    @RequestMapping(value = "/todo/edit", method = RequestMethod.POST)
    public ModelAndView editTodo(@RequestParam("id") Integer id,
                                 @RequestParam("title") String title,
                                 @RequestParam("detail") String detail,
                                 @RequestParam("date") String date,
                                 @RequestParam("time") String time,
                                 @RequestParam("url") String url) {
        Todo todo = new Todo();
        todo.setId(id);
        todo.setTitle(title);
        todo.setDetail(detail);
        Timestamp timestamp = Timestamp.valueOf(date + " " + time);
        todo.setTime(timestamp);
        todo.setUrl(url);
        todoService.edit(todo);
        return new ModelAndView("redirect:/todo");
    }

    @RequestMapping(value = "/todo/remove/{id}", method = RequestMethod.GET)
    public ModelAndView removeTodo(@PathVariable("id") int id) {
        // 根据传入的 ID 调用 TodoService 中的删除方法
        todoService.remove(id);
        return new ModelAndView("redirect:/todo");
    }

    @RequestMapping(value = "/todo/check/{id}", method = RequestMethod.GET)
    public ModelAndView checkTodo(@PathVariable("id") int id) {
        todoService.check(id);
        return new ModelAndView("redirect:/todo");
    }

    @RequestMapping(value = "/todo/find/check/{status}", method = RequestMethod.GET)
    public ModelAndView findCheckTodo(@PathVariable("status") int status) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("todo_list");
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        mav.addObject("todos", todoService.getByChecked(status == 1, userId));
        return mav;
    }

    @RequestMapping(value = "/todo/find/title/{title}", method = RequestMethod.GET)
    public ModelAndView findCheckTodo(@PathVariable("title") String title) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("todo_list");
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        mav.addObject("todos", todoService.getByTitle(title, userId));
        return mav;
    }
}
