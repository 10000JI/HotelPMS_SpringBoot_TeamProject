package com.dev.pms.stock;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StockDAO {
    public int setPartnerStock(PartnerStockVO partnerStockVO) throws Exception;

    public List<PartnerStockVO> getStockList(String businessNumber) throws  Exception;

    public int setStockUpdate(PartnerStockVO partnerStockVO) throws Exception;

    public int setStockDelete(Long itemId) throws Exception;

    public List<PartnerVO> getPartnerList() throws  Exception;


    public int setPartnerDelete(String businessNumber) throws Exception;

    public int setPartnerUpdate(String businessNumber) throws Exception;

    public List<String> getRoomType() throws  Exception;

    public List<HotelStockVO> getHotelStockList() throws  Exception;
}
