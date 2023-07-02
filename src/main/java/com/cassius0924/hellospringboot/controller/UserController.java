package com.cassius0924.hellospringboot.controller;

import com.cassius0924.hellospringboot.model.User;
import com.cassius0924.hellospringboot.service.TodoService;
import com.cassius0924.hellospringboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <b>Date 2023/6/30</b>
 *
 * @author HoChihchou
 */

// 用户控制层
// 以UserController为模板，创建一个名为userController的对象，存放在Spring容器中。
@Controller
public class UserController {
    // @Autowired注解，自动装配，
    // 在Spring容器中，查找名为userService的对象，将其注入到Bean中。
    // Bean: 小驼峰。

    // @Qualifier注解，指定注入的对象名为UserServiceImpl。
    // 将Spring容器中名为UserServiceImpl的对象注入到Bean中。
    // 和@Autowired注解一起使用，服务层有多态时常用。
    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @Autowired
    @Qualifier("todoServiceImpl")
    private TodoService todoService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        return mav;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("register");
        return mav;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("username") String username,
                              @RequestParam("password") String password,
                              @RequestParam("confirm_password") String confirmPassword,
                              HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        if (password.equals(confirmPassword)) {
            if (userService.register(username, password)) {
                request.getSession().setAttribute("userId", userService.getIdByUsername(username));
                mav.setViewName("redirect:/todo");
                System.out.println("用户：" + username + " 注册成功");
            } else {
                mav.setViewName("register");
                System.out.println("注册失败");
            }
        } else {
            mav.setViewName("register");
            System.out.println("两次密码不一致");
        }
        return mav;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("username") String username,
                              @RequestParam("password") String password,
                              HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        if (userService.login(username, password)) {
//            System.out.println(username);
//            System.out.println(userService.getIdByUsername(username));
            request.getSession().setAttribute("userId", userService.getIdByUsername(username));
            mav.setViewName("redirect:/todo");
            System.out.println("用户：" + username + " 登录成功");
        } else {
            mav.setViewName("index");
            System.out.println("登录失败");
        }
        return mav;
    }

    @RequestMapping(value = "/user/edit", method = RequestMethod.POST)
    public ModelAndView editUser(@RequestParam("username") String username,
                                 @RequestParam("password") String password,
                                 @RequestParam("confirm_password") String confirmPassword,
                                 HttpServletRequest request) {
        if (password.equals(confirmPassword)) {
            userService.editPassword((Integer) request.getSession().getAttribute("userId"),  password);
        }
        return new ModelAndView("redirect:/todo");
    }

}
