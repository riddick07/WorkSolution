package com.solution.controller;

import com.solution.model.Author;
import com.solution.model.Book;
import com.solution.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable Integer id) {
        bookService.removeBook(id);
        return "redirect:BookList";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable Integer id) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("id", id);
        return new ModelAndView("EditBook", "model", model);
    }

}
