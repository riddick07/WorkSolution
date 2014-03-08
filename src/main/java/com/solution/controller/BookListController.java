package com.solution.controller;

import com.solution.model.Author;
import com.solution.model.Book;
import com.solution.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
public class BookListController extends SimpleFormController {

    @Autowired
    private IBookService bookService;

    public String getModelName() {
        return "BookList";
    }

    public BookListController() {
        setCommandClass(Book.class);
        setCommandName("book");
    }

    @Override
    protected Map<String, Object> referenceData(HttpServletRequest request) throws Exception {

        Map<String, Object> refData = new HashMap<String, Object>();
        Map<String, Object> model = new HashMap<String, Object>();
        List<Book> books = bookService.listBooks();
        model.put("books", books);
        refData.put("model", model);

        return refData;
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        Book book = (Book) command;
        bookService.addBook(book);

        Map<String, Object> model = new HashMap<String, Object>();
        List<Book> books = bookService.listBooks();
        model.put("books", books);
        return new ModelAndView(getModelName(), "model", model);
    }

}
