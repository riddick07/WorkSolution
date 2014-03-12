package com.solution.service;

import com.solution.model.Book;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface IBookService {
    @Transactional
    void addBook(Book book);

    @Transactional
    List<Book> listBooks();

    @Transactional
    void removeBook(Integer id);

    @Transactional
    Book searchBook(String name);
}
