package gov.iti.Entities;

import jakarta.persistence.*;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id", nullable = false)
    private Long id;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

    @Column(name = "image", length = 100)
    private String image;

    @OneToMany(mappedBy = "category")
    private Set<gov.iti.Entities.Product> products = new LinkedHashSet<>();

    public Category(String name, String image) {
        this.name = name;
        this.image = image;
    }


    public Category() {

    }

    public Category(Long id, String name, String image) {
        this.id = id;
        this.name = name;
        this.image = image;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Set<gov.iti.Entities.Product> getProducts() {
        return products;
    }

    public void setProducts(Set<gov.iti.Entities.Product> products) {
        this.products = products;
    }

}