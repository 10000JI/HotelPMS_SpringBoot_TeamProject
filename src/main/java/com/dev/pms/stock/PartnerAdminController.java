package com.dev.pms.stock;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/partnerAdmin/*")
public class PartnerAdminController {
    @Autowired
    private StockService stockService;

    @GetMapping("partnerList")
    public ModelAndView getStockList() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<PartnerVO> list = stockService.getPartnerList();
        mv.addObject("list",list);
        mv.setViewName("stock/partnerAdminList");
        return mv;
    }


    @PostMapping("partnerDelete")
    @ResponseBody
    public int stockDelete(@RequestBody List<String> businessNumbers) throws Exception{
        int result=0;
        for (String businessNumber : businessNumbers) {
            result = stockService.setPartnerDelete(businessNumber);
        }
        return result;
    }

    @PostMapping("partnerUpdate")
    @ResponseBody
    public int stockUpdate(String businessNumber) throws Exception{
        return stockService.setPartnerUpdate(businessNumber);
    }

    @GetMapping("stockSetting")
    public ModelAndView setStockSetting() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<String> roomTypes = stockService.getRoomType();
        List<HotelStockVO>  hotelStockList = stockService.getHotelStockList();
        mv.addObject("roomTypes",roomTypes);
        mv.addObject("hotelStockList",hotelStockList);
        log.error("::::::{}:::::",hotelStockList.get(0).getPartnerStockVO().getProductName());
        mv.setViewName("stock/stockSetting");
        return mv;
    }
}
