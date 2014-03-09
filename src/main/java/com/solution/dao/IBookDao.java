package com.solution.dao;

import com.solution.model.Book;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: DmitriyK
 * Date: 05.03.14
 * Time: 10:47
 * To change this template use File | Settings | File Templates.
 */
public interface IBookDao {
    Book addBook(Book book);

    List<Book> listBooks();

    void removeBook(Integer id);
}
