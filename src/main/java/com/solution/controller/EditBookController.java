package com.solution.controller;

import com.solution.model.Author;
import com.solution.model.Book;
import com.solution.service.IAuthorService;
import com.solution.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
@RequestMapping("/EditBook.vw")
public class EditBookController {

    @Autowired
    private IBookService bookService;

    @Autowired
    private IAuthorService authorService;


    @RequestMapping(method = RequestMethod.GET)
    protected ModelAndView openMain(@PathVariable("id") int id, Model m) throws Exception {
        Book book = bookService.getById(id);

        m.addAttribute("book", book);

        Map<String, Object> model = new HashMap<String, Object>();
        List<Author> authors = authorService.listAuthor();
        model.put("authors", authors);

        return new ModelAndView("EditBook", "model", model);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView create(@ModelAttribute("book") Book book) throws Exception {
        bookService.updateBook(book);

        Map<String, Object> model = new HashMap<String, Object>();
        List<Book> books = bookService.listBooks();
        model.put("books", books);
        return new ModelAndView("BookList", "model", model);
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ModelAndView initMethod(@RequestParam int id, Model m) throws Exception {
        Book book = bookService.getById(id);

        m.addAttribute("book", book);

        Map<String, Object> model = new HashMap<String, Object>();
        List<Book> books = bookService.listBooks();
        model.put("books", books);
        return new ModelAndView("BookList", "model", model);
    }

}
