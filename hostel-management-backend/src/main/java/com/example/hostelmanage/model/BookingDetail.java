package com.example.hostelmanage.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.DynamicUpdate;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.*;
import java.util.Set;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@DynamicUpdate
@Table(name="bookingDetail")
public class BookingDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

//    @Column
//    private double totalService;
    @Column
    private double totalRoom,total;
    @Column
    private String checkOutTime, checkInTime;

    @Column
    private boolean status;

    @ManyToOne
    @JoinColumn(name = "fk_booking", referencedColumnName = "id" )
    private Booking booking;

//    @JsonIgnore
//    @OneToMany(mappedBy = "bookingDetail", cascade = CascadeType.ALL)
//    private Set<Slot> slot;

    @ManyToOne
    @JoinColumn(name = "fk_room", referencedColumnName = "id" )
    private Room room;

    @ManyToOne
    @JoinColumn(name = "fk_roomCategory", referencedColumnName = "id" )
    private RoomCategory roomCategory;

}
