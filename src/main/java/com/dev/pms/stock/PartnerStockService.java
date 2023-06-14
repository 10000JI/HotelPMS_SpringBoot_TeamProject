package com.dev.pms.stock;


import com.dev.pms.room.BookingVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class PartnerStockService {

    @Autowired
    private PartnerStockDAO partnerStockDAO;

    public List<PartnerStockVO> getStockList(String businessNumber) throws Exception{
        return partnerStockDAO.getStockList(businessNumber);
    }

}