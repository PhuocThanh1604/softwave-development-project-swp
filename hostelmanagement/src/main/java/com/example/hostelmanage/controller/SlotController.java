package com.example.hostelmanage.controller;

import com.example.hostelmanage.model.Account;
import com.example.hostelmanage.model.Booking;
import com.example.hostelmanage.model.BookingDetail;
import com.example.hostelmanage.model.Slot;
import com.example.hostelmanage.repository.BookingDetailRepository;
import com.example.hostelmanage.repository.SlotRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.Optional;
@RestController
@RequestMapping(path="/slot")
public class SlotController {
    @Inject
    public BookingDetailRepository bookingDetailRepository;

    @Inject
    public SlotRepository slotRepository;

    @PostMapping("/create")
    public ResponseEntity<Slot> createSlot(@RequestBody Slot slot){
        slot =   slotRepository.save(slot);
        return new ResponseEntity<>(slot, HttpStatus.CREATED);
    }

    @GetMapping("/all")
    public ResponseEntity<Iterable<Slot>> getAllSlot(){
        Iterable<Slot> list = slotRepository.findAll();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteSlotById(@PathVariable Long id){
        slotRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    /* Update Slot */
    @PutMapping("/update/{id}")
    public ResponseEntity<?> updateSlotById(@PathVariable Long id, @RequestBody Slot slot) throws Exception {
        Optional<Slot> slotID = slotRepository.findById(id);

        if(!slotID.isPresent()){
            throw new Exception("slot not found");
        }

        Slot thisSlot = slotID.get();

        if(slot.getSlot() != 0)
            thisSlot.setSlot(slot.getSlot());
        if(slot.getPrice() != 0)
            thisSlot.setPrice(slot.getPrice());
        if(slot.getHour() != 0)
            thisSlot.setHour(slot.getHour());
        if(slot.getPercent() != 0)
            thisSlot.setPercent(slot.getPercent());

        thisSlot.setStatus(slot.isStatus());

        thisSlot = slotRepository.save(thisSlot);

        return new ResponseEntity<>(thisSlot, HttpStatus.OK);
    }

    /* Update bookingdetail for Slot */
    @PutMapping("/update/{id}/bookingdetail/{bookingdetail_id}")
    public ResponseEntity<?> updateBookingdetailforSlot(
            @PathVariable Long id,
            @PathVariable Long bookingdetail_id
    ) throws Exception {
        Optional<Slot> slot = slotRepository.findById(id);
        if(!slot.isPresent()){
            throw new Exception("Slot not found");
        }
        Optional<BookingDetail> bookingDetail = bookingDetailRepository.findById(bookingdetail_id);
        if(!bookingDetail .isPresent()){
            throw new Exception("bookingDetail  not found");
        }

        /* Set bookingdetail to Slot */
        Slot thisSlot = slot.get();
        thisSlot.setBookingDetail(bookingDetail.get());

        thisSlot = slotRepository.save(thisSlot);

        return new ResponseEntity<>(thisSlot, HttpStatus.OK);

    }
}
