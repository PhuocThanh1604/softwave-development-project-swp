package com.example.hostelmanage.controller;

import com.example.hostelmanage.model.Service;
import com.example.hostelmanage.model.ServiceCategory;
import com.example.hostelmanage.repository.ServiceCategoryRepository;
import com.example.hostelmanage.repository.ServiceRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.Optional;

@RestController
@RequestMapping("/service")
public class ServiceController {

    @Inject
    public ServiceRepository serviceRepository;

    @Inject
    public ServiceCategoryRepository serviceCategoryRepository;

    @PostMapping("/create")
    public ResponseEntity<Service> createService(@RequestBody Service service){
        serviceRepository.save(service);
        return new ResponseEntity<>(service, HttpStatus.CREATED);
    }

    @GetMapping("/all")
    public ResponseEntity<Iterable<Service>> getAllService(){
        Iterable<Service> list = serviceRepository.findAll();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteService(@PathVariable Long id){
        serviceRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    /* Update Service */
    @PutMapping("/update/{id}")
    public ResponseEntity<?> updateServiceById(@PathVariable Long id, @RequestBody Service service) throws Exception {
        Optional<Service> svc = serviceRepository.findById(id);

        if(!svc.isPresent()){
            throw new Exception("Service not found");
        }

        Service thisService = svc.get();

        if(service.getName() != null)
            thisService.setName(service.getName());

        if(service.getPrice() != null)
            thisService.setPrice(service.getPrice());

        if(service.getQuantity() != null)
            thisService.setQuantity(service.getQuantity());

        if(service.getImg() != null)
            thisService.setImg(service.getImg());


        thisService.setStatus(service.isStatus());

        thisService = serviceRepository.save(thisService);

        return new ResponseEntity<>(thisService, HttpStatus.OK);
    }

    /* Update Category for Service */
    @PutMapping("/update/{id}/category/{cate_id}")
    public ResponseEntity<?> updateCateforService(
            @PathVariable Long id,
            @PathVariable Long cate_id
    ) throws Exception {
        Optional<Service> service = serviceRepository.findById(id);
        if(!service.isPresent()){
            throw new Exception("Service not found");
        }
        Optional<ServiceCategory> category = serviceCategoryRepository.findById(cate_id);
        if(!category.isPresent()){
            throw new Exception("Category not found");
        }

        /* Set category to service */
        Service thisService = service.get();
        thisService.setServiceCategory(category.get());

        thisService = serviceRepository.save(thisService);

        return new ResponseEntity<>(thisService, HttpStatus.OK);

    }

}
