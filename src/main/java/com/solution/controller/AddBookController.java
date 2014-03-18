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
import java.util.*;

@Controller
@RequestMapping("/AddBook.vw")
public class AddBookController {

    @Autowired
    private IBookService bookService;

    @Autowired
    private IAuthorService authorService;

    @RequestMapping(method = RequestMethod.GET)
    protected ModelAndView openMain(Model m) throws Exception {
        m.addAttribute("book", new Book());

        Map<String, Object> model = new HashMap<String, Object>();
        List<Author> authors = authorService.listAuthor();
        model.put("authors", authors);

        return new ModelAndView(getModelName(), "model", model);
    }

    private String getModelName() {
        return "AddBook";
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView create(@ModelAttribute("book") Book book, ModelMap modelMap) throws Exception {
        List<String> authorNames = book.getAuthorNames();
        Set<Author> authors = new HashSet<Author>(authorNames.size());
        for (String name : authorNames) {
            List<Author> byName = authorService.getByName(name);
            if (!byName.isEmpty()) {
                Author author = byName.get(0);
                authors.add(author);
            }
        }

        book.setAuthors(authors);
        bookService.addBook(book);

        Map<String, Object> model = new HashMap<String, Object>();
        List<Book> books = bookService.listBooks();
        model.put("books", books);
        return new ModelAndView("BookList", "model", model);
    }
}
