package com.dev.pms.stock;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class HotelStockVO {
    private Long inventoryId;
    private Long itemId;
    private Long currentStock;
    private Long autoOrderQuantity;
    private String orderStatus;
    private Long roomUsageStatus;

    private PartnerStockVO partnerStockVO;
}