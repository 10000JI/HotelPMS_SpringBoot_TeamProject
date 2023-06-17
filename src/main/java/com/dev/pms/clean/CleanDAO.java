package com.dev.pms.clean;

import com.dev.pms.room.ReservedVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CleanDAO {

    public List<CalenderVO>getCleanList(CalenderVO calenderVO)throws Exception;

    public int insertSchedule(CalenderVO calenderVO)throws Exception;
    public int deleteSchedule(CalenderVO calenderVO)throws Exception;

    public CalenderVO getTodayClean(CalenderVO calenderVO)throws Exception;

    public List<ReservedVO>getRequestClean(CalenderVO calenderVO) throws Exception;

    public int updateCleaningInProgress(ReservedVO reservedVO) throws Exception;

    public int CleaningComplete(ReservedVO reservedVO) throws Exception;
}
