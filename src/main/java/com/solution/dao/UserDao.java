package com.solution.dao;

import com.solution.dao.model.User;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Map;

public class UserDao {

    @PersistenceContext
    protected EntityManager em;


    public User create(User user) {
        em.persist(user);
        return user;
    }

    public void delete(final Object id) {
        this.em.remove(this.em.getReference(User.class, id));
    }

    public User find(final Object id) {
        return (User) this.em.find(User.class, id);
    }

    public User update(final User t) {
        return this.em.merge(t);
    }
}
