package gov.iti.Entities;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id", nullable = false)
    private Long id;

    @Column(name = "name", nullable = false, length = 250)
    private String name;

    @Column(name = "description", length = 500)
    private String description;

    @Column(name = "price", nullable = false, precision = 10, scale = 2)
    private BigDecimal price;
    
    @Transient
    private BigDecimal productPriceAfterDiscount;

    @ColumnDefault("'0'")
    @Column(name = "quantity", columnDefinition = "int UNSIGNED not null")
    private Long quantity;

    @ColumnDefault("0")
    @Column(name = "discount", nullable = false)
    private Integer discount;

    @Column(name = "image", length = 100)
    private String image;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;

    public Product(Long id, String name, String description, BigDecimal price, Long quantity, Integer discount, String image, Category category) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.discount = discount;
        this.image = image;
        this.category = category;
    }

    public Product( String name, String description, BigDecimal price, Long quantity, Integer discount, String image, Category category) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.discount = discount;
        this.image = image;
        this.category = category;
    }
    public Product() {

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Transient
public BigDecimal getProductPriceAfterDiscount() {
    BigDecimal discountPercentage = BigDecimal.valueOf(this.getDiscount())
                                              .divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);
    BigDecimal discountAmount = this.getPrice()
                                    .multiply(discountPercentage)
                                    .setScale(2, RoundingMode.HALF_UP);
    return this.getPrice().subtract(discountAmount);
}

}