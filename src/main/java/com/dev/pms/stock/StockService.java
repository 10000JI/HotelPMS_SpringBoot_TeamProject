package com.dev.pms.stock;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class StockService {

    @Autowired
    private StockDAO stockDAO;

    public List<PartnerStockVO> getStockList(String businessNumber) throws Exception {
        return stockDAO.getStockList(businessNumber);
    }

    public int setPartnerStock(PartnerStockVO partnerStockVO) throws Exception {
        return stockDAO.setPartnerStock(partnerStockVO);
    }

    public int setStockUpdate(PartnerStockVO partnerStockVO) throws Exception {
        return stockDAO.setStockUpdate(partnerStockVO);
    }

    public int setStockDelete(Long itemId) throws Exception {
        return stockDAO.setStockDelete(itemId);
    }

    public List<PartnerVO> getPartnerList() throws Exception {
        return stockDAO.getPartnerList();
    }

    public int setPartnerDelete(String businessNumber) throws Exception{
        return stockDAO.setPartnerDelete(businessNumber);
    }

    public int setPartnerUpdate(String businessNumber) throws Exception{
        return stockDAO.setPartnerUpdate(businessNumber);
    }

    public  List<String> getRoomType() throws Exception {
        return stockDAO.getRoomType();
    }

    public List<HotelStockVO> getHotelStockList() throws  Exception{
        return stockDAO.getHotelStockList();
    }

}