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
@Table(name="booking")
public class Booking {

    @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String bookingTime,checkOutTime,CheckInTime;

    @Column
    private double price;

    @Column
    private  double surcharge;

    @Column
    private  double prepayment;

    @Column
    private boolean status;

    @JsonIgnore
    @OneToMany(mappedBy="booking", cascade = CascadeType.ALL)
    private Set<BookingDetail> bookingDetail;

    @ManyToOne
    @JoinColumn(name = "fk_account", referencedColumnName = "id" )
    private Account account;


}
