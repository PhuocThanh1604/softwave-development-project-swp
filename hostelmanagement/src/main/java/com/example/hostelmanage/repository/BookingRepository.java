package com.example.hostelmanage.repository;

import com.example.hostelmanage.model.Booking;
import org.springframework.data.repository.CrudRepository;

public interface BookingRepository extends CrudRepository<Booking, Long>{
}
