package codes.fdk.coffeediary.coffee;

import org.eclipse.microprofile.graphql.GraphQLApi;
import org.eclipse.microprofile.graphql.Query;
import java.util.List;

@GraphQLApi
public class CoffeeResolver {

    private final CoffeeService service;

    public CoffeeResolver(CoffeeService service) {
        this.service = service;
    }

    @Query
    public List<Coffee> getCoffees() {
        return service.findAll();
    }
}