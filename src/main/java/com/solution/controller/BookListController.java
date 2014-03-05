package com.solution.controller;

import com.solution.model.Book;
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

//        BookDao bookDao = new BookDao();
//        List<Book> books = bookDao.getAll();
        List<Book> books = new ArrayList<>();
        Book book = new Book();
        book.setName("Holkings");
        book.setYear("2002");
        books.add(book);

        List<String> names = new ArrayList<String>();
        names.add("Alex");

        book.setAuthorNames(names);

        //TODO: Display list of books

        model.put("books", books);

        return new ModelAndView(getModelName(), "model", model);
    }

}
