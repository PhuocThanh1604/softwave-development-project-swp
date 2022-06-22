package com.example.hostelmanage.controller;


import com.example.hostelmanage.model.BookingDetail;
import com.example.hostelmanage.model.Booking;
import com.example.hostelmanage.model.Room;
import com.example.hostelmanage.model.ServiceDetail;
import com.example.hostelmanage.repository.BookingDetailRepository;
import com.example.hostelmanage.repository.BookingRepository;
import com.example.hostelmanage.repository.RoomRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.Optional;
@RestController
@RequestMapping(path = "/bookingdetail")
public class BookingDetailController {
    @Inject
    public BookingDetailRepository bookingDetailRepository;

    @Inject
    public RoomRepository roomRepository;

    @Inject
    public BookingRepository bookingRepository;

    @PostMapping("/create")
    public ResponseEntity<BookingDetail> createBookingDetail(@RequestBody BookingDetail bookingDetail){
        bookingDetail =  bookingDetailRepository.save(bookingDetail);
        return new ResponseEntity<>(bookingDetail, HttpStatus.CREATED);
    }

    @GetMapping("/all")
    public ResponseEntity<Iterable<BookingDetail>> getAllBookingDetail(){
        Iterable<BookingDetail> list = bookingDetailRepository.findAll();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteBookingDetailById(@PathVariable Long id){
        bookingDetailRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    /* Update roomid for bookingDetail */
    @PutMapping("/update/{id}/room/{room_id}")
    public ResponseEntity<?> updateRoomforBookingDetail(
            @PathVariable Long id,
            @PathVariable Long room_id
    ) throws Exception {
        Optional<BookingDetail> bookingDetail = bookingDetailRepository.findById(id);
        if(!bookingDetail.isPresent()){
            throw new Exception("bookingDetail  not found");
        }

        Optional<Room> room = roomRepository.findById(room_id);
        if(!room.isPresent()) {
            throw new Exception("room not found");
        }

        /* Set booking to bookingDetail */
        BookingDetail thisBookingDetail = bookingDetail.get();
        thisBookingDetail.setRoom(room.get());

        thisBookingDetail  = bookingDetailRepository.save(thisBookingDetail );

        return new ResponseEntity<>(thisBookingDetail , HttpStatus.OK);

    }
    /* Update booking for bookingDetail */
    @PutMapping("/update/{id}/booking/{booking_id}")
    public ResponseEntity<?> updateBookingforBookingDetail(
            @PathVariable Long id,
            @PathVariable Long booking_id
    ) throws Exception {
        Optional<BookingDetail> bookingDetail = bookingDetailRepository.findById(id);
        if(!bookingDetail.isPresent()){
            throw new Exception("bookingDetail  not found");
        }

        Optional<Booking> booking = bookingRepository.findById(booking_id);
        if(!bookingDetail.isPresent()) {
            throw new Exception("bookingDetail not found");
        }

        /* Set booking to bookingDetail */
        BookingDetail thisBookingDetail = bookingDetail.get();
        thisBookingDetail.setBooking(booking.get());

        thisBookingDetail  = bookingDetailRepository.save(thisBookingDetail );

        return new ResponseEntity<>(thisBookingDetail , HttpStatus.OK);

    }
}
