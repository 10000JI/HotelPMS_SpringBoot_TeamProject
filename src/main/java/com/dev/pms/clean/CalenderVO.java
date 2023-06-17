package com.dev.pms.clean;

import com.dev.pms.room.ReservedVO;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.List;


@Getter
@Setter
public class CalenderVO {
    private Date scheduleStartdate;
    private Date scheduleEnddate;
    private Long scheduleNumber;

    private List<ReservedVO> reservedVOS;
}
