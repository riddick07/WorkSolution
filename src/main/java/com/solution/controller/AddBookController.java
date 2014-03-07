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
    protected ModelAndView onSubmit(Object command) throws Exception {
        Book book = (Book) command;

        //TODO: get book from view and add to DB
        List<Author> authors = new ArrayList<Author>();
        Author author = new Author();
        author.setName("Alex");
        author.setSurname("Cross");
        authors.add(author);

        Map<String, Object> model = new HashMap<String, Object>();
        model.put("authors", authors);
        model.put("book", book);

//        authorService.addAuthor(author);

        return new ModelAndView(getModelName(), "model", model);
    }

}
