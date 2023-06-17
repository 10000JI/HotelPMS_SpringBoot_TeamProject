package com.dev.pms.clean;

import com.dev.pms.room.ReservedVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Slf4j
@Service
public class CleanService {

    @Autowired
    private CleanDAO cleanDAO;

    public List<CalenderVO>getCleanList(CalenderVO calenderVO)throws Exception{
        return cleanDAO.getCleanList(calenderVO);
    }

    public int insertSchedule(CalenderVO calenderVO)throws Exception{
        return cleanDAO.insertSchedule(calenderVO);
    }
    public int deleteSchedule(CalenderVO calenderVO)throws Exception{
        System.out.println(calenderVO.getScheduleNumber());
        return cleanDAO.deleteSchedule(calenderVO);
    }

    public CalenderVO getTodayClean(CalenderVO calenderVO)throws Exception{
        return cleanDAO.getTodayClean(calenderVO);
    }
    public List<ReservedVO> getRequestClean(CalenderVO calenderVO) throws Exception{
        return cleanDAO.getRequestClean(calenderVO);
    }

    public int updateCleaningInProgress(ReservedVO reservedVO) throws Exception{
        return cleanDAO.updateCleaningInProgress(reservedVO);
    }

    public int CleaningComplete(ReservedVO reservedVO) throws Exception{
        return cleanDAO.CleaningComplete(reservedVO);
    }
}
