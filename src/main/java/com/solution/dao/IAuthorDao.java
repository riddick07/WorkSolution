package com.solution.dao;

import com.solution.model.Author;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: DmitriyK
 * Date: 05.03.14
 * Time: 10:12
 * To change this template use File | Settings | File Templates.
 */
public interface IAuthorDao {
    void addAuthor(Author author);

    List<Author> listAuthors();

    void removeAuthor(Integer id);
}
