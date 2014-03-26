package com.solution.controller;

import com.solution.model.Book;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/HomePage.vw")
public class HomePageController {

    @RequestMapping(method = RequestMethod.GET)
    protected ModelAndView openMain(Model m) throws Exception {
        m.addAttribute("book", new Book());

        return new ModelAndView("HomePage");
    }

}
