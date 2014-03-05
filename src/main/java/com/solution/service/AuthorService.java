package com.solution.service;

import com.solution.dao.IAuthorDao;
import com.solution.model.Author;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AuthorService implements IAuthorService {

    @Autowired
    private IAuthorDao authorDao;

    @Override
    @Transactional
    public void addAuthor(Author author) {
        authorDao.addAuthor(author);
    }

    @Override
    @Transactional
    public List<Author> listAuthor() {
        return authorDao.listAuthors();
    }

    @Override
    @Transactional
    public void removeAuthor(Integer id) {
        authorDao.removeAuthor(id);
    }

}
