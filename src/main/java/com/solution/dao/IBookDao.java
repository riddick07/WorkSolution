package com.solution.dao;

import com.solution.model.Book;

import java.util.List;

public interface IBookDao {
    Book addBook(Book book);

    List<Book> listBooks();

    void removeBook(Integer id);

    public void updateBook(Book book);

    Book getById(Integer id);
}
