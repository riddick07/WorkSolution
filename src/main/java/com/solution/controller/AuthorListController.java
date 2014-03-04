package com.solution.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.solution.dao.AuthorDao;
import com.solution.dao.model.Author;
import org.springframework.web.servlet.ModelAndView;

import com.solution.dao.model.Book;

public class AuthorListController extends GeneralController {

    @Override
    public String getModelName() {
        return "AuthorList";
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        List<Author> authors = new ArrayList<Author>();
        Author author = new Author();
        author.setName("Holkings");
        author.setSurname("tel");
        authors.add(author);

        //TODO: Display list of authors

        AuthorDao authorDao = new AuthorDao();
        authorDao.create(author);

        List<Author> all = authorDao.getAll();

        model.put("authors", all);

        return new ModelAndView(getModelName(), "model", model);
    }

}
