package com.example.hostelmanage.controller;

import com.example.hostelmanage.model.ServiceCategory;
import com.example.hostelmanage.repository.ServiceCategoryRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.Optional;

@RestController
@RequestMapping("/servicecategory")
public class ServiceCategoryController {

    @Inject
    public ServiceCategoryRepository serviceCategoryRepository;

    @PostMapping("/create")
    public ResponseEntity<ServiceCategory> createCategory(@RequestBody ServiceCategory serviceCategory){
        serviceCategory =  serviceCategoryRepository.save(serviceCategory);
        return new ResponseEntity<>(serviceCategory, HttpStatus.CREATED);
    }

    @GetMapping("/all")
    public ResponseEntity<Iterable<ServiceCategory>> getAllCategory(){
        Iterable<ServiceCategory> list = serviceCategoryRepository.findAll();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteCategoryById(@PathVariable Long id){
       serviceCategoryRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<?> updateCategoryById(@PathVariable Long id, @RequestBody ServiceCategory serviceCategory) throws Exception {
        Optional<ServiceCategory> category = serviceCategoryRepository.findById(id);

        if(!category.isPresent()){
            throw new Exception("Service category not found");
        }

        ServiceCategory thisCategory = category.get();

        if(serviceCategory.getName() != null)
            thisCategory.setName(serviceCategory.getName());


        thisCategory.setStatus(serviceCategory.isStatus());

        return new ResponseEntity<>(thisCategory, HttpStatus.OK);
    }
}
