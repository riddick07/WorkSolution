package com.solution.dao;

import com.solution.dao.model.Book;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Collection;
import java.util.List;

public class BookDao {

    @PersistenceContext
    protected EntityManager em;


    public Book create(Book book) {
        em.persist(book);
        return book;
    }
    public List<Book> getAll(){
        Query query = em.createQuery("SELECT e FROM Book e");
        return (List<Book>) query.getResultList();
    }

    public void delete(final Object id) {
        this.em.remove(this.em.getReference(Book.class, id));
    }

    public Book find(final Object id) {
        return (Book) this.em.find(Book.class, id);
    }

    public Book update(final Book book) {
        return this.em.merge(book);
    }
}
