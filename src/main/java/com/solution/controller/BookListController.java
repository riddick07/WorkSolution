package com.solution.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

public class BookListController extends GeneralController {

    @Override
    public String getModelName() {
        return "BookList";
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        model.put("book1", "Tomas Guid");
        model.put("book2", "Anser Tomas");

        if (SecurityContextHolder.getContext().getAuthentication().isAuthenticated() && !"anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getName())) {
            response.sendRedirect(request.getContextPath() + "/pages/BookList.vw");
        }

        return new ModelAndView(getModelName(), "model", model);
    }

}
