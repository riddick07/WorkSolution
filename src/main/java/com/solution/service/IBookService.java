package com.solution.service;

import com.solution.model.Book;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: DmitriyK
 * Date: 05.03.14
 * Time: 10:49
 * To change this template use File | Settings | File Templates.
 */
public interface IBookService {
    @Transactional
    void addBook(Book book);

    @Transactional
    List<Book> listBooks();

    @Transactional
    void removeBook(Integer id);
}
