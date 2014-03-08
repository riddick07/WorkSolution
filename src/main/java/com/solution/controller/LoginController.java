package com.solution.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

@Controller
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

        return new ModelAndView(getModelName(), "model", model);
    }

}
