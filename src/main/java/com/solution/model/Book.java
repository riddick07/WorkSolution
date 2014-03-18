package com.solution.model;

import org.hibernate.annotations.CollectionOfElements;
import org.hibernate.mapping.Collection;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "solution_book")
public class Book implements Serializable {

    private static final long serialVersionUID = -7233580203924480960L;

    private Integer id;
    private String name;
    private String description;
    private String year;
    private Set<Author> authors;
    private List<String> authorNames;

    @ManyToMany(targetEntity = Author.class, mappedBy = "books", fetch = FetchType.EAGER)
    public Set<Author> getAuthors() {
        return authors;
    }

    public void setAuthors(Set<Author> authors) {
        this.authors = authors;
    }

    @Id
    @Column(name = "book_id")
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column
    public String getDescription() {
        return description;
    }

    @CollectionOfElements(fetch = FetchType.EAGER)
    public List<String> getAuthorNames() {
        return authorNames;
    }

    public void setAuthorNames(List<String> authorNames) {
        this.authorNames = authorNames;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column
    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Book book = (Book) o;

        if (authorNames != null ? !authorNames.equals(book.authorNames) : book.authorNames != null) return false;
        if (description != null ? !description.equals(book.description) : book.description != null) return false;
        if (id != null ? !id.equals(book.id) : book.id != null) return false;
        if (name != null ? !name.equals(book.name) : book.name != null) return false;
        if (year != null ? !year.equals(book.year) : book.year != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (year != null ? year.hashCode() : 0);
        result = 31 * result + (authorNames != null ? authorNames.hashCode() : 0);
        return result;
    }


    @Override
    public String toString() {
        return super.toString();    //To change body of overridden methods use File | Settings | File Templates.
    }
}
