package com.solution.controller;

import com.solution.model.Author;
import com.solution.model.Book;
import com.solution.service.IAuthorService;
import com.solution.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EditAuthorController extends SimpleFormController {

    @Autowired
    private IAuthorService authorService;

    public EditAuthorController() {
        setCommandClass(Author.class);
        setCommandName("author");
    }

    @Override
    protected Map<String, Object> referenceData(HttpServletRequest request) throws Exception {
        Map<String, Object> referenceData = new HashMap<String, Object>();
        return referenceData;
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        Author author = (Author) command;
        author.setFullName(author.getName() + " " + author.getSurname());

        authorService.addAuthor(author);

        Map<String, Object> model = new HashMap<String, Object>();
        List<Author> authors = authorService.listAuthor();
        model.put("authors", authors);
        return new ModelAndView("AuthorList", "model", model);
    }

}
