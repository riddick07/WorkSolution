package com.solution.service;

import com.solution.model.Author;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface IAuthorService {
    @Transactional
    void addAuthor(Author author);

    @Transactional
    List<Author> listAuthor();

    @Transactional
    void removeAuthor(Integer id);

    @Transactional
    List<Author> getByName(String fullName);
}
