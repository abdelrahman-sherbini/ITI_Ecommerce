package gov.iti.Entities;

import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;

@Entity
@Table(name = "cart")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cart_id", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private gov.iti.Entities.User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "product_id")
    private gov.iti.Entities.Product product;

    @Column(name = "quantity", columnDefinition = "int UNSIGNED")
    private Long quantity;

    public BigDecimal getTotal() {
        BigDecimal total = BigDecimal.ZERO;
        total= getProduct().getProductPriceAfterDiscount().multiply(BigDecimal.valueOf(getQuantity()));
        return total;
    }

    @Transient
    BigDecimal total;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public gov.iti.Entities.User getUser() {
        return user;
    }

    public void setUser(gov.iti.Entities.User user) {
        this.user = user;
    }

    public gov.iti.Entities.Product getProduct() {
        return product;
    }

    public void setProduct(gov.iti.Entities.Product product) {
        this.product = product;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

}