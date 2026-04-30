package codes.fdk.coffeediary.coffee;

import io.quarkus.hibernate.orm.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;
import java.util.List;

@ApplicationScoped
public class CoffeeRepository implements PanacheRepository<Coffee> {

    public List<Coffee> findAllCoffees() {
        return find("SELECT c FROM Coffee c " +
                "LEFT JOIN FETCH c.roastery " +
                "LEFT JOIN FETCH c.type " +
                "LEFT JOIN FETCH c.countries " +
                "LEFT JOIN FETCH c.profileTags")
                .list();
    }
}