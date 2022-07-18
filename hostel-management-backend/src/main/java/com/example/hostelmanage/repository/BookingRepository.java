package com.example.hostelmanage.repository;

import com.example.hostelmanage.model.Booking;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface BookingRepository extends CrudRepository<Booking, Long>{
    @Query(value = "SELECT * FROM Booking WHERE fk_account = ?1 AND fk_bookingstatus = 1 ", nativeQuery = true)
    List<Booking> findBookingDetailToPay(Long account_id);

    @Query(value="SELECT * FROM Booking WHERE fk_account = ?1 AND fk_bookingstatus = 3", nativeQuery = true)
    List<Booking> findBookingDetailCancelled(Long account_id);

    @Query(value = "CALL SearchtoCheckIn(?1)" , nativeQuery = true)
    List<Map<String, Object>> searchtoCheckIn(String chekInTime);

    @Query(value = "CALL SearchtoCheckOut(?1, ?2)" , nativeQuery = true)
    Map<String, Long> searchtoCheckOut(String chekInTime, Long roomId);

    @Query(value = "CALL ShowDetail(?1)" , nativeQuery = true)
    Map<String, Object> showDetail(Long roomId);

    @Query(value = "CALL BookingList()" , nativeQuery = true)
    List<Map<String, Object>> showBookingList();



}
