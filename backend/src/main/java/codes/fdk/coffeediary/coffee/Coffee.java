package codes.fdk.coffeediary.coffee;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Set;
import codes.fdk.coffeediary.resource.Image;
import codes.fdk.coffeediary.rating.CoffeeRating;
import codes.fdk.coffeediary.roastery.Roastery;

@Entity
@Table(name = "coffee")
public class Coffee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "roastery_id", nullable = false)
    private Roastery roastery;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "type_id", nullable = false)
    private CoffeeType type;

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

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "coffee_country",
            joinColumns = @JoinColumn(name = "coffee_id"),
            inverseJoinColumns = @JoinColumn(name = "country_id")
    )
    private Set<Country> countries;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "coffee_profile_tag",
            joinColumns = @JoinColumn(name = "coffee_id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id")
    )
    private Set<ProfileTag> profileTags;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "coffee_image",
            joinColumns = @JoinColumn(name = "coffee_id"),
            inverseJoinColumns = @JoinColumn(name = "image_id")
    )
    private Set<Image> images;

    @OneToMany(mappedBy = "coffee", fetch = FetchType.LAZY)
    private Set<CoffeeRating> ratings;

    // Getters and Setters

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

    public Roastery getRoastery() {
        return roastery;
    }

    public void setRoastery(Roastery roastery) {
        this.roastery = roastery;
    }

    public CoffeeType getType() {
        return type;
    }

    public void setType(CoffeeType type) {
        this.type = type;
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

    public Set<Country> getCountries() {
        return countries;
    }

    public void setCountries(Set<Country> countries) {
        this.countries = countries;
    }

    public Set<ProfileTag> getProfileTags() {
        return profileTags;
    }

    public void setProfileTags(Set<ProfileTag> profileTags) {
        this.profileTags = profileTags;
    }

    public Set<Image> getImages() {
        return images;
    }

    public void setImages(Set<Image> images) {
        this.images = images;
    }

    public Set<CoffeeRating> getRatings() {
        return ratings;
    }

    public void setRatings(Set<CoffeeRating> ratings) {
        this.ratings = ratings;
    }
}
