package com.solution.dao;

import com.solution.model.Book;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDao implements IBookDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Book addBook(Book book) {
        sessionFactory.getCurrentSession().save(book);
        return book;
    }

    @Override
    public List<Book> listBooks() {
        return sessionFactory.getCurrentSession().createQuery("from Book").list();
    }

    @Override
    public void removeBook(Integer id) {
        Book book = (Book) sessionFactory.getCurrentSession().load(Book.class, id);
        if (null != book) {
            sessionFactory.getCurrentSession().delete(book);
        }
    }
}
