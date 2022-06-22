package com.example.hostelmanage.repository;

import com.example.hostelmanage.model.Service;
import org.springframework.data.repository.CrudRepository;

public interface ServiceRepository extends CrudRepository<Service, Long> {
}
