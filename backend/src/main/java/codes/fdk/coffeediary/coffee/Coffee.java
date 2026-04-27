package codes.fdk.coffeediary.coffee;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "coffee")
public class Coffee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(name = "arabica", nullable = false)
    private Short arabica;

    @Column(nullable = false)
    private Short robusta;

    @Column(name = "profile_description", nullable = false)
    private String profileDescription;

    @Column(name = "price", nullable = false, columnDefinition = "money")
    private BigDecimal price;

    @Column(nullable = false)
    private String link;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

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

    public Short getArabica() {
        return arabica;
    }

    public void setArabica(Short arabica) {
        this.arabica = arabica;
    }

    public Short getRobusta() {
        return robusta;
    }

    public void setRobusta(Short robusta) {
        this.robusta = robusta;
    }

    public String getProfileDescription() {
        return profileDescription;
    }

    public void setProfileDescription(String profileDescription) {
        this.profileDescription = profileDescription;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}