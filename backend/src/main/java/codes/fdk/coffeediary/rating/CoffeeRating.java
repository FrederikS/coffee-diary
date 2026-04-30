package codes.fdk.coffeediary.rating;

import codes.fdk.coffeediary.coffee.CoffeeDrinkType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import codes.fdk.coffeediary.coffee.Coffee;

@Entity
@Table(name = "coffee_rating")
public class CoffeeRating {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "coffee_id", nullable = false)
    private Coffee coffee;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(nullable = false)
    private Short rating;

    @ManyToOne
    @JoinColumn(name = "drink_type_id")
    private CoffeeDrinkType drinkType;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Coffee getCoffee() {
        return coffee;
    }

    public void setCoffee(Coffee coffee) {
        this.coffee = coffee;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Short getRating() {
        return rating;
    }

    public void setRating(Short rating) {
        this.rating = rating;
    }

    public CoffeeDrinkType getDrinkType() {
        return drinkType;
    }

    public void setDrinkType(CoffeeDrinkType drinkType) {
        this.drinkType = drinkType;
    }
}
