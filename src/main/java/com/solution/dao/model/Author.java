package com.solution.dao.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Table(name = "solution_author")
public class Author {

    @Id
    @Column(name="author_id")
    @GeneratedValue
    private Integer id;

    @Column
    private String name;

    @Column
    private String surname;

    @OneToMany(mappedBy="solution_authors")
    private List<Book> books;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }
}
