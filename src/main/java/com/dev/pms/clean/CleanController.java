package com.dev.pms.clean;

import com.dev.pms.room.ReservedVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@Slf4j
public class CleanController {

    @Autowired
    private CleanService cleanService;
    @RequestMapping("clean/*")

    @GetMapping("/cleanSchedule")
    public ModelAndView cleanSchedule(CalenderVO calenderVO) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<CalenderVO>calenderVOList=cleanService.getCleanList(calenderVO);
        List<ReservedVO>RequestClean =cleanService.getRequestClean(calenderVO);
        mv.addObject("events",calenderVOList);
        mv.addObject("request",RequestClean);
        mv.setViewName("clean/cleanSchedule");

        return mv;

    }

//    @GetMapping("cleanCheckList")
//    @ResponseBody
//    public ModelAndView cleanUpdate(CalenderVO calenderVO) throws Exception {
//        ModelAndView mv = new ModelAndView();
//        List<ReservedVO>RequestClean =cleanService.getRequestClean(calenderVO);
//        mv.addObject("request",RequestClean);
//        mv.setViewName("clean/cleanCheckList");
//        return mv;
//    }




    @PostMapping("insertSchedule")
    public ModelAndView insertSchedule(CalenderVO calenderVO) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = cleanService.insertSchedule(calenderVO);
        mv.setViewName("redirect:/clean/cleanSchedule");
        return mv;
    }
    @PostMapping("/deleteSchedule")
    public ModelAndView deleteSchedule(CalenderVO calenderVO)throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = cleanService.deleteSchedule(calenderVO);
        return mv;
    }

    @PostMapping ("/updateCleaningInProgress")
    public ModelAndView updateCleaningInProgress(ReservedVO reservedVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = cleanService.updateCleaningInProgress(reservedVO);
        return mv;
    }

    @PostMapping("/cleaningComplete")
    public ModelAndView CleaningComplete(ReservedVO reservedVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = cleanService.CleaningComplete(reservedVO);
        return mv;
    }

}
