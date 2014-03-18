package com.solution.controller;

import com.solution.model.Book;
import com.solution.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
@RequestMapping("/BookList.vw")
public class BookListController {

    @Autowired
    private IBookService bookService;

    public String getModelName() {
        return "BookList";
    }

    public BookListController() {
    }

    @RequestMapping(method = RequestMethod.GET)
    protected ModelAndView openMain() throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        List<Book> books = bookService.listBooks();
        model.put("books", books);

        return new ModelAndView(getModelName(), "model", model);
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    @ResponseBody
    public ModelAndView delete(@PathVariable int id) throws Exception {
        bookService.removeBook(id);
        return new ModelAndView(getModelName());
    }

    @RequestMapping(method = RequestMethod.PUT)
    @ResponseBody
    public ModelAndView search(@RequestParam String name) throws Exception {
        Book book = bookService.searchBook(name.trim());
        List<Book> books = new ArrayList<Book>();
        books.add(book);
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("books", books);

        return new ModelAndView("redirect:BookList.vw", "model", model);
    }
}
