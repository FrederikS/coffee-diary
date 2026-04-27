package codes.fdk.coffeediary.coffee;

import jakarta.enterprise.context.ApplicationScoped;
import java.util.List;

@ApplicationScoped
public class CoffeeService {

    private final CoffeeRepository repository;

    public CoffeeService(CoffeeRepository repository) {
        this.repository = repository;
    }

    public List<Coffee> findAll() {
        return repository.findAllCoffees();
    }
}