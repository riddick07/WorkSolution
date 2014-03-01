package com.solution.controller;

import com.google.gson.Gson;
import com.solution.dao.model.Book;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class BookListController extends GeneralController {

    @Override
    public String getModelName() {
        return "BookList";
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        List<Book> books = new ArrayList<Book>();
        Book book = new Book();
        book.setName("Holkings");
        book.setDate(new Date());
        book.setAuthor("Herlingem");

        model.put("books", books);

        return new ModelAndView(getModelName(), "model", model);
    }

}
