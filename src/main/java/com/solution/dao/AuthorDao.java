package com.solution.dao;

import com.solution.model.Author;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class AuthorDao implements IAuthorDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addAuthor(Author author) {
        sessionFactory.getCurrentSession().save(author);
    }

    @Override
    public List<Author> listAuthors() {
        return sessionFactory.getCurrentSession().createQuery("from Author").list();
    }

    @Override
    public void removeAuthor(Integer id) {
        Author contact = (Author) sessionFactory.getCurrentSession().load(Author.class, id);
        if (null != contact) {
            sessionFactory.getCurrentSession().delete(contact);
        }
    }
}
