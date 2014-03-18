package com.solution.controller;

import com.solution.model.Author;
import com.solution.model.Book;
import com.solution.service.AuthorService;
import com.solution.service.IAuthorService;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/AddAuthor.vw")
public class AddAuthorController {

    @Autowired
    private IAuthorService authorService;

    public String getModelName() {
        return "AddAuthor";
    }

    @RequestMapping(method = RequestMethod.GET)
    protected ModelAndView openMain(Model m) throws Exception {
        m.addAttribute("author", new Author());

        return new ModelAndView(getModelName());
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView search(@ModelAttribute("author") Author author) throws Exception {
        author.setFullName(author.getName() + " " + author.getSurname());

        authorService.addAuthor(author);

        Map<String, Object> model = new HashMap<String, Object>();
        List<Author> all = authorService.listAuthor();
        model.put("authors", all);

        return new ModelAndView("AuthorList", "model", model);
    }
}
