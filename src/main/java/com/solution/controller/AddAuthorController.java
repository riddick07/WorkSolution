package com.solution.controller;

import com.solution.model.Author;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddAuthorController extends GeneralController {

    @Override
    public String getModelName() {
        return "AddAuthor";
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView(getModelName());
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addContact(@ModelAttribute("contact") Author author,
                             BindingResult result) {
        //TODO: get author from view and add to DB
//        dao.addAuthor(author);

        return "redirect:/index";
    }

}
