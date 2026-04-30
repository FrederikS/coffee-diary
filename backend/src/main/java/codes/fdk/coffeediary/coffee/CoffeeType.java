package codes.fdk.coffeediary.coffee;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "coffee_type")
public class CoffeeType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    @Column(nullable = false)
    private String value;

    public Short getId() {
        return id;
    }

    public void setId(Short id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
