package com.solution.dao;

import com.solution.dao.model.User;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class UserDao {

    @PersistenceContext
    protected EntityManager em;


    public User create(User user) {
        em.persist(user);
        return user;
    }
}
