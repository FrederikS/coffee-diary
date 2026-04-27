package codes.fdk.coffeediary.roastery;

import jakarta.enterprise.context.ApplicationScoped;
import java.util.Optional;

@ApplicationScoped
public class RoasteryService {

    private final RoasteryRepository repository;

    public RoasteryService(RoasteryRepository repository) {
        this.repository = repository;
    }

    public Optional<Roastery> findById(Long id) {
        return repository.findByIdOptional(id);
    }
}
