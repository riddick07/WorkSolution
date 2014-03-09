package com.solution.dao;

import com.solution.model.Author;

import java.util.List;

public interface IAuthorDao {
    Author addAuthor(Author author);

    List<Author> listAuthors();

    void removeAuthor(Integer id);

    public void updateAuthor(Author author);
}
