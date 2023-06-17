package com.dev.pms.room;

import com.dev.pms.clean.CalenderVO;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.List;

@Setter
@Getter
public class ReservedVO {
    private  Long reservationNum;
    private Date reservationDate;
    private  Long roomNumber;
    private  String roomType;
    private  String roomStatus;

    private BookingVO bookingVOs;


}