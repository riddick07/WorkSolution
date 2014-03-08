package com.solution.controller;

import com.solution.model.Author;
import com.solution.service.AuthorService;
import com.solution.service.IAuthorService;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AddAuthorController extends SimpleFormController {

    @Autowired
    private IAuthorService authorService;

    public String getModelName() {
        return "AddAuthor";
    }

    public AddAuthorController() {
        setCommandClass(Author.class);
        setCommandName("author");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        Author author = (Author) command;
        author.setFullName(author.getName() + " " + author.getSurname());

        authorService.addAuthor(author);

        Map<String, Object> model = new HashMap<String, Object>();
        List<Author> all = authorService.listAuthor();
        model.put("authors", all);

        return new ModelAndView("AuthorList", "model", model);
    }

}
