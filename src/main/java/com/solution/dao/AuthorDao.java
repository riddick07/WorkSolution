package com.solution.dao;

import com.solution.dao.model.Author;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class AuthorDao {

    @PersistenceContext
    protected EntityManager em;


    public Author create(Author author) {
        em.persist(author);
        return author;
    }

    public void delete(final Object id) {
        this.em.remove(this.em.getReference(Author.class, id));
    }

    public Author find(final Object id) {
        return (Author) this.em.find(Author.class, id);
    }

    public Author update(final Author author) {
        return this.em.merge(author);
    }
}
