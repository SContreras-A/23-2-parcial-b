package co.edu.unisabana.parcialarquitectura.repository;

import co.edu.unisabana.parcialarquitectura.service.model.Checkin;
import co.edu.unisabana.parcialarquitectura.service.model.Checkout;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CheckpointPort extends JpaRepository {

  void saveCheckout(Checkout checkpoints);

  Checkin findLastCheckin(String driver, String facility);

  void finishCheckin(Checkin checkin);
}