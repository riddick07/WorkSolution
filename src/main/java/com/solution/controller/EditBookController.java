package com.solution.controller;

import com.solution.dao.model.Book;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EditBookController extends GeneralController
{

    @Override
    public String getModelName()
    {
        return "EditBook";
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        List<Book> books = new ArrayList<Book>();

        model.put("books", books);

        return new ModelAndView(getModelName(), "model", model);
    }

}
