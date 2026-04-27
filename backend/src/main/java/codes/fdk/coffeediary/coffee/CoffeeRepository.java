package codes.fdk.coffeediary.coffee;

import io.quarkus.hibernate.orm.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;
import java.util.List;

@ApplicationScoped
public class CoffeeRepository implements PanacheRepository<Coffee> {

    public List<Coffee> findAllCoffees() {
        return listAll();
    }
}