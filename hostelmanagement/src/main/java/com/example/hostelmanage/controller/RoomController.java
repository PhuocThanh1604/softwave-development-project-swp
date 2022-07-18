package com.example.hostelmanage.controller;

import com.example.hostelmanage.model.*;
import com.example.hostelmanage.repository.BookingDetailRepository;
import com.example.hostelmanage.repository.RoomCategoryRepository;
import com.example.hostelmanage.repository.RoomRepository;
import com.example.hostelmanage.repository.RoomStatusRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.Optional;

@RestController
@RequestMapping("/room")
@CrossOrigin(origins = "http://localhost:3000")
public class RoomController {

    @Inject
    public RoomRepository roomRepository;

    @Inject
    public RoomCategoryRepository roomCategoryRepository;

    @Inject
    public RoomStatusRepository roomStatusRepository;

    @PostMapping("/create")
    public ResponseEntity<Room> createRoom(@RequestBody Room room){
        room =  roomRepository.save(room);
        return new ResponseEntity<>(room, HttpStatus.CREATED);
    }

    @GetMapping("/all")
    public ResponseEntity<Iterable<Room>>  getAllRoom(){
        Iterable<Room> list = roomRepository.findAll();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteRoomById(@PathVariable Long id){
        roomRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<?> updateRoomById(@PathVariable Long id, @RequestBody Room room) throws Exception {
        Optional<Room> roomID = roomRepository.findById(id);

        if(!roomID.isPresent()){
            throw new Exception("Room not found");
        }

        Room thisCategory = roomID.get();

        if(room.getName() != null)
            thisCategory.setName(room.getName());
        if(room.getImg() != null)
            thisCategory.setImg(room.getImg());
        if(room.getPrice() != 0)
            thisCategory.setPrice(room.getPrice());
        if(room.getFinishTime() != null)
            thisCategory.setFinishTime(room.getFinishTime());

        thisCategory.setStatus(room.isStatus());
        thisCategory= roomRepository.save(thisCategory); // save into db
        return new ResponseEntity<>(thisCategory, HttpStatus.OK);
    }


    /* Update roomCate for Room */
    @PutMapping("/update/{id}/roomcategory/{cate_id}")
    public ResponseEntity<?> updateCategoryforRoom(
            @PathVariable Long id,
            @PathVariable Long cate_id
    ) throws Exception {
        Optional<Room> room = roomRepository.findById(id);
        if(!room.isPresent()){
            throw new Exception("Room not found");
        }

        Optional<RoomCategory> category = roomCategoryRepository.findById(cate_id);
        if(!category.isPresent()){
            throw new Exception("Category not found");
        }


        /* Set category to room */
        Room thisRoom = room.get();
        thisRoom.setRoomCategory(category.get());

        thisRoom = roomRepository.save(thisRoom);

        return new ResponseEntity<>(thisRoom, HttpStatus.OK);

    }

    /* Update roomStatus for Room */
    @PutMapping("/update/{id}/roomstatus/{cate_id}")
    public ResponseEntity<?> updateRoomStatusforRoom(
            @PathVariable Long id,
            @PathVariable Long status_id
    ) throws Exception {
        Optional<Room> room = roomRepository.findById(id);
        if(!room.isPresent()){
            throw new Exception("Room not found");
        }

        Optional<RoomStatus> roomStatus = roomStatusRepository.findById(status_id);
        if(!roomStatus.isPresent()){
            throw new Exception("RoomStatus not found");
        }


        /* Set status to room */
        Room thisRoom = room.get();
        thisRoom.setRoomStatus(roomStatus.get());

        thisRoom = roomRepository.save(thisRoom);

        return new ResponseEntity<>(thisRoom, HttpStatus.OK);

    }


}
