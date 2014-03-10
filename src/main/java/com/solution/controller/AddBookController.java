package com.solution.controller;

import com.solution.model.Author;
import com.solution.model.Book;
import com.solution.service.IAuthorService;
import com.solution.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/AddBook.vw")
public class AddBookController extends SimpleFormController {

    @Autowired
    private IBookService bookService;

    @Autowired
    private IAuthorService authorService;

    public AddBookController() {
        setCommandClass(Book.class);
        setCommandName("book");
    }

    @Override
    protected Map<String, Object> referenceData(HttpServletRequest request) throws Exception {

        Map<String, Object> referenceData = new HashMap<String, Object>();
        List<String> authors = new ArrayList<String>();
        List<Author> authorList = authorService.listAuthor();
        for (Author author : authorList) {
            authors.add(author.getFullName());
        }
        referenceData.put("authorNames", authors);

        return referenceData;
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        Book book = (Book) command;
        bookService.addBook(book);

        Map<String, Object> model = new HashMap<String, Object>();
        List<Book> books = bookService.listBooks();
        model.put("books", books);
        return new ModelAndView("BookList", "model", model);
    }

}
