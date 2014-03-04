package com.solution.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.solution.dao.UserDao;
import com.solution.dao.model.User;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;

public class LoginController extends GeneralController {
    @Override
    public String getModelName() {
        return "Login";
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String login = (String) ResourceBundle.getBundle("context").getObject("solution.login");
        Map<String, Object> model = new HashMap<String, Object>();

        model.put("login", login);

        if (SecurityContextHolder.getContext().getAuthentication().isAuthenticated() && !"anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getName())) {
            response.sendRedirect(request.getContextPath() + "/pages/EditBook.vw");
        }

        UserDao userDao = new UserDao();

        User user = new User();



        userDao.create(user);

        return new ModelAndView(getModelName(), "model", model);
    }

}
