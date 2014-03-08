package com.solution.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.solution.model.Author;
import com.solution.service.IAuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthorListController extends GeneralController {

    @Autowired
    private IAuthorService authorService;

    public String getModelName() {
        return "AuthorList";
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        List<Author> all = authorService.listAuthor();
        model.put("authors", all);

        return new ModelAndView(getModelName(), "model", model);
    }

}
