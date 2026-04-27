package codes.fdk.coffeediary.roastery;

import io.quarkus.hibernate.orm.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class RoasteryRepository implements PanacheRepository<Roastery> {

}
