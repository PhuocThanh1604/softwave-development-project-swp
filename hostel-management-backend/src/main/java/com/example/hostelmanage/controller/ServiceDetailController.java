package com.example.hostelmanage.controller;

import com.example.hostelmanage.model.*;
import com.example.hostelmanage.repository.BookingDetailRepository;
import com.example.hostelmanage.repository.ServiceDetailRepository;
import com.example.hostelmanage.repository.ServiceRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.Optional;
@RestController
@RequestMapping("/servicedetail")
public class ServiceDetailController {


        @Inject
        public ServiceDetailRepository serviceDetailRepository;

        @Inject
        public ServiceRepository serviceRepository;

        @Inject
        public BookingDetailRepository bookingDetailRepository;

        @PostMapping("/create")
        public ResponseEntity<ServiceDetail> createServiceDetail(@RequestBody ServiceDetail serviceDetail){
            serviceDetailRepository.save(serviceDetail);
            return new ResponseEntity<>(serviceDetail, HttpStatus.CREATED);
        }

        @GetMapping("/all")
        public ResponseEntity<Iterable<ServiceDetail>> getAllServiceDetail(){
            Iterable<ServiceDetail> list = serviceDetailRepository.findAll();
            return new ResponseEntity<>(list, HttpStatus.OK);
        }

        @DeleteMapping("/delete/{id}")
        public ResponseEntity<?> deleteServiceDetail(@PathVariable Long id){
            serviceDetailRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.OK);
        }

        /* Update ServiceDetail */
        @PutMapping("/update/{id}")
        public ResponseEntity<?> updateServiceDetailById(@PathVariable Long id, @RequestBody ServiceDetail serviceDetail) throws Exception {
            Optional<ServiceDetail> svd = serviceDetailRepository.findById(id);

            if(!svd.isPresent()){
                throw new Exception("ServiceDetail not found");
            }

            ServiceDetail thisServiceDetail = svd.get();

            if(serviceDetail.getTotal() != 0)
                thisServiceDetail.setTotal(serviceDetail.getTotal());

            if(serviceDetail.getQuantity() != 0)
                thisServiceDetail.setQuantity(serviceDetail.getQuantity());


            thisServiceDetail = serviceDetailRepository.save(thisServiceDetail);

            return new ResponseEntity<>(thisServiceDetail, HttpStatus.OK);
        }

        /* Update Service for ServiceDetail */
        @PutMapping("/update/{id}/service/{cate_id}")
        public ResponseEntity<?> updateCateforServiceDetail(
                @PathVariable Long id,
                @PathVariable Long cate_id
        ) throws Exception {
            Optional<ServiceDetail> serviceDetail = serviceDetailRepository.findById(id);
            if(!serviceDetail.isPresent()){
                throw new Exception("ServiceDetail not found");
            }
            Optional<Service> category = serviceRepository.findById(cate_id);
            if(!category.isPresent()){
                throw new Exception("Category not found");
            }

            /* Set category to service */
            ServiceDetail thisServiceDetail = serviceDetail.get();
            thisServiceDetail.setService(category.get());

            thisServiceDetail = serviceDetailRepository.save(thisServiceDetail);

            return new ResponseEntity<>(thisServiceDetail, HttpStatus.OK);

        }

    /* Update bookingdetail for serviceDetail */
    @PutMapping("/update/{id}/bookingdetail/{bookingdetail_id}")
    public ResponseEntity<?> updateBookingDetailForServiceDetail(
            @PathVariable Long id,
            @PathVariable Long bookingdetail_id
    ) throws Exception {
        Optional<ServiceDetail> serviceDetail = serviceDetailRepository.findById(id);
        if(!serviceDetail.isPresent()){
            throw new Exception("serviceDetail not found");
        }

        Optional<BookingDetail> bookingDetail = bookingDetailRepository.findById(bookingdetail_id);
        if(!bookingDetail.isPresent()) {
            throw new Exception("bookingDetail not found");
        }

        /* Set bookingDetail to serviceDetail */
        ServiceDetail thisServiceDetail = serviceDetail.get();
        thisServiceDetail.setBookingDetail(bookingDetail.get());

        thisServiceDetail = serviceDetailRepository.save(thisServiceDetail);

        return new ResponseEntity<>(thisServiceDetail, HttpStatus.OK);

    }

}
