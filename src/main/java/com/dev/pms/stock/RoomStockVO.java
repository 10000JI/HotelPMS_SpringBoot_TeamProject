package com.dev.pms.stock;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RoomStockVO {
    private String roomType;
    private Long inventoryId;
    private Long count;
}
