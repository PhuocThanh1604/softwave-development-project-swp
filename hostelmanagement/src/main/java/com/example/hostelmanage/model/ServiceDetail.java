package com.example.hostelmanage.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ServiceDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private Integer quantity;

    @Column
    private Double total;

    @Column
    private Boolean status;

    @ManyToOne
    @JoinColumn(name = "fk_service", referencedColumnName = "id" )
    private Service service;

    @ManyToOne
    @JoinColumn(name = "fk_booking_detail", referencedColumnName = "id" )
    private BookingDetail bookingDetail;


}
