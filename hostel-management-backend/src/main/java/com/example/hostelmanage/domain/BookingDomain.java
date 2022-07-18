package com.example.hostelmanage.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BookingDomain {
    private String bookingTime, note, checkOutTime, checkInTime, email, fullName, cardNumber;

    private double price, surcharge, prepayment;

    private int people, quantity;
}
