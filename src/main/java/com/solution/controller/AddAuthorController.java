package com.solution.controller;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddAuthorController extends GeneralController {

    @Override
    public String getModelName() {
        return "AddAuthor";
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //TODO: get author from view and add to DB


        return new ModelAndView(getModelName());
    }

}
