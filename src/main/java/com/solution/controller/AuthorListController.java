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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

@Controller
@RequestMapping("/AuthorList.vw")
public class AuthorListController {

    @Autowired
    private IAuthorService authorService;

    public String getModelName() {
        return "AuthorList";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    protected ModelAndView handleRequestInternal() throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        List<Author> all = authorService.listAuthor();
        model.put("authors", all);

        return new ModelAndView(getModelName(), "model", model);
    }

    @RequestMapping(value = "/delete/{ids}", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView delete(@PathVariable("ids") Integer id) throws Exception {
        authorService.removeAuthor(id);
        return new ModelAndView(getModelName());
    }
}
