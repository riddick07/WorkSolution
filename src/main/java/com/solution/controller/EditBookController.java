package com.solution.controller;

import com.solution.model.Author;
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
        //TODO: get book from view and add to DB
        List<Author> authors = new ArrayList<Author>();
        Author author = new Author();
        author.setName("Alex");
        author.setSurname("Cross");
        authors.add(author);

        Map<String, Object> model = new HashMap<String, Object>();
        model.put("authors", authors);

        return new ModelAndView(getModelName(),"model", model);
    }

}
