package com.solution.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public abstract class GeneralController extends AbstractController {
    public abstract String getModelName();

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        String serviceURL = (String) ResourceBundle.getBundle("context").getObject("rest.service.url");
        String pageId = request.getParameter("pageId");
        Map<String, Object> model = new HashMap<String, Object>();

        model.put("pageId", pageId);
        return new ModelAndView(getModelName(), "model", model);
    }

}