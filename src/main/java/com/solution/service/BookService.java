package com.solution.service;

import com.solution.dao.IBookDao;
import com.solution.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookService implements IBookService {

    @Autowired
    private IBookDao bookDao;

    @Override
    @Transactional
    public void addBook(Book book) {
        bookDao.addBook(book);
    }

    @Override
    @Transactional
    public List<Book> listBooks() {
        return bookDao.listBooks();
    }

    @Override
    @Transactional
    public void removeBook(Integer id) {
        bookDao.removeBook(id);
    }


    public Book searchBook(String name) {
        name = name.replace("=", "");
        List<Book> books = listBooks();
        for (Book book : books) {
            if (book.getName().contains(name
            )) return book;
        }
        return null;
    }


}
