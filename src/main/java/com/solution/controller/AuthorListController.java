package com.solution.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.solution.model.Author;
import com.solution.service.IAuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthorListController extends GeneralController {

//    @Autowired
//    private IAuthorService authorService;

    @Override
    public String getModelName() {
        return "AuthorList";
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        List<Author> authors = new ArrayList<Author>();
        Author author = new Author();
        author.setName("Holkings");
        author.setSurname("tel");
        authors.add(author);

        //TODO: Display list of authors

//        authorService.addAuthor(author);

//        List<Author> all = authorService.listAuthor();

        model.put("authors", authors);

        return new ModelAndView(getModelName(), "model", model);
    }

}
