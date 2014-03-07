package com.solution.controller;

import com.solution.model.Author;
import com.solution.model.Book;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AddBookController extends SimpleFormController {

    public String getModelName() {
        return "AddBook";
    }

    public AddBookController() {
        setCommandClass(Book.class);
        setCommandName("book");
    }

    @Override
    protected Map<String, Object> referenceData(HttpServletRequest request) throws Exception {

        Map<String, Object> referenceData = new HashMap<String, Object>();
        List<String> authors = new ArrayList<String>();
        authors.add("Alex");
        //TODO: Get authors from service
        referenceData.put("authorNames", authors);

        return referenceData;
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        Book book = (Book) command;

        //TODO: save Book
//        authorService.addAuthor(author);

        return new ModelAndView("BookList", "book", book);
    }

}
