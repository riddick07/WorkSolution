package com.solution.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.solution.model.Author;
import com.solution.model.Book;
import com.solution.service.IAuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

@Controller
@RequestMapping("/AuthorList.vw")
public class AuthorListController extends SimpleFormController {

    @Autowired
    private IAuthorService authorService;

    public String getModelName() {
        return "AuthorList";
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        List<Author> all = authorService.listAuthor();
        model.put("authors", all);

        return new ModelAndView(getModelName(), "model", model);
    }

    public AuthorListController() {
        setCommandClass(Book.class);
        setCommandName("book");
    }

    @Override
    protected Map<String, Object> referenceData(HttpServletRequest request) throws Exception {

        Map<String, Object> refData = new HashMap<String, Object>();
        Map<String, Object> model = new HashMap<String, Object>();

        List<Author> all = authorService.listAuthor();
        model.put("authors", all);
        refData.put("model", model);

        return refData;
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        Author author = (Author) command;
        authorService.addAuthor(author);

        Map<String, Object> model = new HashMap<String, Object>();
        List<Author> all = authorService.listAuthor();
        model.put("authors", all);
        return new ModelAndView(getModelName(), "model", model);
    }

}
