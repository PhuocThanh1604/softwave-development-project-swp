package com.example.hostelmanage.controller;


import com.example.hostelmanage.model.*;
import com.example.hostelmanage.repository.BookingDetailRepository;
import com.example.hostelmanage.repository.BookingRepository;
import com.example.hostelmanage.repository.AccountRepository;
import com.example.hostelmanage.repository.ServiceCategoryRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.Optional;

@RestController
@RequestMapping(path="/booking")
public class BookingController {

    @Inject
    public BookingRepository bookingRepository;

    @Inject
    public AccountRepository  accountRepository;

    @PostMapping("/create")
    public ResponseEntity<Booking> createBooking(@RequestBody Booking booking){
        booking =  bookingRepository.save(booking);
        return new ResponseEntity<>(booking, HttpStatus.CREATED);
    }

    @GetMapping("/all")
    public ResponseEntity<Iterable<Booking>> getAllBooking(){
        Iterable<Booking> list = bookingRepository.findAll();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteBookingById(@PathVariable Long id){
        bookingRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    /* Update Booking */
    @PutMapping("/update/{id}")
    public ResponseEntity<?> updateBookingById(@PathVariable Long id, @RequestBody Booking booking) throws Exception {
        Optional<Booking> bookingID = bookingRepository.findById(id);

        if(!bookingID.isPresent()){
            throw new Exception("Service not found");
        }

        Booking thisBooking = bookingID.get();

        if(booking.getPrice() != 0)
            thisBooking.setPrice(booking.getPrice());
        if(booking.getCheckInTime() != null)
            thisBooking.setCheckInTime(booking.getCheckInTime());
        if(booking.getBookingTime() != null)
            thisBooking.setBookingTime(booking.getBookingTime());
        if(booking.getCheckOutTime() != null)
            thisBooking.setCheckOutTime(booking.getCheckOutTime());

        thisBooking.setStatus(booking.isStatus());

        thisBooking = bookingRepository.save(thisBooking);

        return new ResponseEntity<>(thisBooking, HttpStatus.OK);
    }

    /* Update account for Boooking */
    @PutMapping("/update/{id}/account/{account_id}")
    public ResponseEntity<?> updateCateforBooking(
            @PathVariable Long id,
            @PathVariable Long account_id
    ) throws Exception {
        Optional<Booking> booking = bookingRepository.findById(id);
        if(!booking.isPresent()){
            throw new Exception("Booking not found");
        }
        Optional<Account> account = accountRepository.findById(account_id);
        if(!account .isPresent()){
            throw new Exception("account  not found");
        }

        /* Set accountID to Booking */
        Booking thisBooking = booking.get();
        thisBooking.setAccount(account.get());

        thisBooking = bookingRepository.save(thisBooking);

        return new ResponseEntity<>(thisBooking, HttpStatus.OK);

    }

}
