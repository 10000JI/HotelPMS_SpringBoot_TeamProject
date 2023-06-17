package com.dev.pms.stock;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/partnerStock/*")
public class PartnerStockController {

    @Autowired
    private StockService partnerStockService;

    @GetMapping("stockList")
    public ModelAndView getStockList() throws Exception {
        ModelAndView mv = new ModelAndView();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String name1 = authentication.getName();
        List<PartnerStockVO> list = partnerStockService.getStockList(name1);
        mv.addObject("list",list);
        mv.setViewName("stock/partnerStockList");
        return mv;
    }
    @PostMapping("stockInsert")
    public ModelAndView setPartnerStock(PartnerStockVO partnerStockVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = partnerStockService.setPartnerStock(partnerStockVO);
        mv.setViewName("redirect:/partnerStock/stockList");
        return mv;
    }

    @PostMapping("stockUpdate")
    public ModelAndView setStockUpdate(PartnerStockVO partnerStockVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = partnerStockService.setStockUpdate(partnerStockVO);
        mv.setViewName("redirect:/partnerStock/stockList");
        return mv;
    }

    @PostMapping("stockDelete")
    @ResponseBody
    public int stockDelete(@RequestParam Long itemIds[]) throws Exception{
        int result=0;
        for (Long itemId : itemIds) {
            result = partnerStockService.setStockDelete(itemId);
        }
        return result;
    }
}
