package codes.fdk.coffeediary.roastery;

import org.eclipse.microprofile.graphql.GraphQLApi;
import org.eclipse.microprofile.graphql.Query;

@GraphQLApi
public class RoasteryResource {

    private final RoasteryService service;

    public RoasteryResource(RoasteryService service) {
        this.service = service;
    }

    @Query
    public Roastery getRoasteryById(Long id) {
        return service.findById(id).orElse(null);
    }

}
