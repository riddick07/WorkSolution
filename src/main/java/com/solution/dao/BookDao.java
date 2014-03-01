package com.solution.dao;

import com.solution.dao.model.Book;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class BookDao {

    @PersistenceContext
    protected EntityManager em;


    public Book create(Book user) {
        em.persist(user);
        return user;
    }

    public void delete(final Object id) {
        this.em.remove(this.em.getReference(Book.class, id));
    }

    public Book find(final Object id) {
        return (Book) this.em.find(Book.class, id);
    }

    public Book update(final Book t) {
        return this.em.merge(t);
    }
}
