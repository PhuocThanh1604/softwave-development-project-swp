package com.example.hostelmanage.controller;

import com.example.hostelmanage.domain.CheckOutDomain;
import com.example.hostelmanage.model.*;
import com.example.hostelmanage.repository.*;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping(path = "/checkout")
public class CheckOutController {
    @Inject
    public BookingRepository bookingRepository;

    @Inject
    public BookingStatusRepository bookingStatusRepository;

    @Inject
    public RoomRepository roomRepository;

    @Inject
    public RoomStatusRepository roomStatusRepository;

    @Inject
    public BookingDetailRepository bookingDetailRepository;


    @GetMapping("/room/{room_id}/time/{today}")
    public ResponseEntity<?> searchToCheckOut(@PathVariable Long room_id, @PathVariable String today) throws Exception {
        Map<String, Long> booking =  bookingRepository.searchtoCheckOut(today, room_id);
        return new ResponseEntity<>(booking, HttpStatus.OK);
    }

    @PutMapping("/booking/{booking_id}/room/{room_id}")
    public ResponseEntity<?> checkOut(@PathVariable Long booking_id, @PathVariable Long room_id, @RequestBody CheckOutDomain checkoutData)throws Exception {
        // Booking complete
        Optional<Booking> booking = bookingRepository.findById(booking_id);
        Booking thisBooking = booking.get();
        Optional<BookingStatus> bookingStatus = bookingStatusRepository.findById(Long.valueOf(2));
        thisBooking.setSurcharge(checkoutData.getExtra());
        thisBooking.setBookingStatus(bookingStatus.get());

        // Set total for booking detail
        Optional<BookingDetail> bookingDetail = bookingDetailRepository.findBookingDetailByBookingId(thisBooking.getId());
        BookingDetail thisBookingDetail = bookingDetail.get();
        thisBookingDetail.setTotal(checkoutData.getTotal());

        // Room available
        Optional<Room> room = roomRepository.findById(room_id);
        Optional<RoomStatus> roomStatus = roomStatusRepository.findById(Long.valueOf(1));
        Room thisRoom = room.get();
        RoomStatus thisRoomStatus = roomStatus.get();

        thisRoom.setRoomStatus(thisRoomStatus);

        bookingRepository.save(thisBooking);
        bookingDetailRepository.save(thisBookingDetail);
        roomRepository.save(thisRoom);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
