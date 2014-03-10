package com.solution.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

@Controller
@RequestMapping(value = "/Login.vw")
public class LoginController extends AbstractController {

    public String getModelName() {
        return "Login";
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String login = (String) ResourceBundle.getBundle("context").getObject("solution.login");
        Map<String, Object> model = new HashMap<String, Object>();

        model.put("login", login);

        return new ModelAndView(getModelName(), "model", model);
    }

}
