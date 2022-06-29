package com.example.hostelmanage.controller;



import com.example.hostelmanage.model.RoomCategory;
import com.example.hostelmanage.repository.RoomCategoryRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.Optional;

@RestController
@RequestMapping("/roomcategory")
public class RoomCategoryController {

    @Inject
    public RoomCategoryRepository roomCategoryRepository;

    @PostMapping("/create")
    public ResponseEntity<RoomCategory> createRoomCate(@RequestBody RoomCategory roomCategory){
        roomCategory =  roomCategoryRepository.save(roomCategory);
        return new ResponseEntity<>(roomCategory, HttpStatus.CREATED);
    }

    @GetMapping("/all")
    public ResponseEntity<Iterable<RoomCategory>> getAllRoomCate(){
        Iterable<RoomCategory> list = roomCategoryRepository.findAll();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteRoomCateById(@PathVariable Long id){
        roomCategoryRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<?> updateRoomCateById(@PathVariable Long id, @RequestBody RoomCategory roomCategory) throws Exception {
        Optional<RoomCategory> category = roomCategoryRepository.findById(id);

        if(!category.isPresent()){
            throw new Exception("Room category not found");
        }

        RoomCategory thisCategory = category.get();

        if(roomCategory.getName() != null)
            thisCategory.setName(roomCategory.getName());
        if(roomCategory.getPrice() != 0)
            thisCategory.setPrice(roomCategory.getPrice());

        thisCategory.setStatus(roomCategory.isStatus());
        thisCategory= roomCategoryRepository.save(thisCategory); // save into db
        return new ResponseEntity<>(thisCategory, HttpStatus.OK);
    }
}

