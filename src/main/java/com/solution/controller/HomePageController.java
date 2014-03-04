package com.solution.controller;

import com.solution.dao.model.Book;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class HomePageController extends GeneralController {

    @Override
    public String getModelName() {
        return "HomePage";
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView(getModelName());
    }

}
