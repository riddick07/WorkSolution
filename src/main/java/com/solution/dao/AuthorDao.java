package com.solution.dao;

import com.solution.dao.model.Author;
import com.solution.dao.model.Book;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;


@Transactional
public class AuthorDao {

    @PersistenceContext(unitName = "SolutionPersistenceUnit")
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

    public List<Author> getAll() {
        Query query = em.createQuery("SELECT e FROM Author e");
        return (List<Author>) query.getResultList();
    }

}
