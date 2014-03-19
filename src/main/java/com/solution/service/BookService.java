package com.solution.service;

import com.solution.dao.IBookDao;
import com.solution.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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
    public Book getById(int id) {
        return bookDao.getById(id);
    }

    @Override
    @Transactional
    public void removeBook(Integer id) {
        bookDao.removeBook(id);
    }

    @Override
    @Transactional
    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }

    @Override
    @Transactional
    public List<Book> searchBook(String name) {
        List<Book> books = listBooks();
        List<Book> res = new ArrayList<Book>();
        for (Book book : books) {
            if (book.getName() != null)
                if (book.getName().contains(name))
                    res.add(book);
        }
        return res;
    }


}
