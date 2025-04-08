package gov.iti.Entities;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "`order`")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "payment_id", nullable = false)
    private gov.iti.Entities.Payment payment;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private gov.iti.Entities.User user;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "city", nullable = false)
    private String city;

    @Column(name = "governorate", nullable = false)
    private String governorate;
    
    @Column(name = "status", nullable = false, length = 100)
    private String status;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "date")
    private Instant date;

    @PrePersist
    public void prePersist() {
        if (this.date == null) {
            this.date = Instant.now();  // Set the current timestamp as default if null
        }
    }

    @OneToMany(mappedBy = "order")
    private Set<gov.iti.Entities.OrderedProduct> orderedProducts = new LinkedHashSet<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public gov.iti.Entities.Payment getPayment() {
        return payment;
    }

    public void setPayment(gov.iti.Entities.Payment payment) {
        this.payment = payment;
    }

    public gov.iti.Entities.User getUser() {
        return user;
    }

    public void setUser(gov.iti.Entities.User user) {
        this.user = user;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getGovernorate() {
        return governorate;
    }

    public void setGovernorate(String governorate) {
        this.governorate = governorate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Instant getDate() {
        return date;
    }

    public void setDate(Instant date) {
        this.date = date;
    }

    public Set<gov.iti.Entities.OrderedProduct> getOrderedProducts() {
        return orderedProducts;
    }

    public void setOrderedProducts(Set<gov.iti.Entities.OrderedProduct> orderedProducts) {
        this.orderedProducts = orderedProducts;
    }

}