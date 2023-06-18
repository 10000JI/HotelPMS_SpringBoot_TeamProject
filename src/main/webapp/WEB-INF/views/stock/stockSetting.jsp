<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Home</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="/assets/img/favicon.png" />
    <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js" crossorigin="anonymous"></script>
    <style>

        .custom-checkbox {
            display: flex;
            align-items: center;
        }

        .custom-checkbox input[type="checkbox"] {
            margin-right: 40px;
        }

    </style>
</head>
<body class="nav-fixed">
<!-- Header Section Begin -->
<c:import url="../temp/topheader.jsp"></c:import>
<!-- Header End -->
<div id="layoutSidenav">
    <!-- Header Section Begin -->
    <c:import url="../temp/leftheader.jsp"></c:import>
    <!-- Header End -->
    <div id="layoutSidenav_content">
<main>
<!-- Main page content-->
<div class="container-xl px-4 mt-4">
    <div class="card invoice">
        <div class="card-header p-4 p-md-5 border-bottom-0 bg-gradient-primary-to-secondary text-white-50">
            <div class="row justify-content-between align-items-center">
                <div class="col-12 col-lg-auto mb-5 mb-lg-0 text-center text-lg-start">
                    <div class="h2 text-white mb-0">객실 별 소모품 설정</div>
                </div>
            </div>
        </div>
        <div class="card-body p-4 p-md-5">
            <!-- Invoice table-->
            <div class="container">
                <label style="margin-bottom: 15px;">객실타입</label>
                <div class="dropdown">
                    <button class="btn btn-outline-black dropdown-toggle" id="selectedRoomTypeButton" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${roomTypes[0]}</button>
                    <div class="dropdown-menu animated--fade-in-up" aria-labelledby="selectedRoomTypeButton">
                        <c:forEach items="${roomTypes}" var="roomType">
                            <a class="dropdown-item" href="#" data-roomtype="${roomType}">${roomType}</a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- Invoice table-->
            <div class="container">
                <div class="row">
                <label style="margin-top: 30px; margin-bottom: 15px;">비품설정</label>
                    <div class="col-10">
                    <div class="card border-start-lg border-dark mb-4">
                        <div class="card-body">
                            <table class="table table-borderless">
                                <tbody>
                                <c:forEach items="${hotelStockList}" var="hotelStockList" varStatus="status">
                                    <tr class="row" data-max-stock="${hotelStockList.currentStock}" id="row${status.index}">
                                        <td class="col-6">
                                            <label class="custom-checkbox">
                                                <input type="checkbox" class="myCheckbox">
                                                    ${hotelStockList.partnerStockVO.productName}(${hotelStockList.partnerStockVO.itemCode})
                                            </label>
                                        </td>
                                        <td class="col-6">
                                            <button type="button" class="btn btn-dark plusbtn"
                                                    style="border: none">+</button>
                                            <button type="button" class="btn btn-dark minusbtn"
                                                    style="border: none">-</button>
                                            <input type="text" id="stockLabel${status.index}" name="stockLabel${status.index}" value="0" readonly>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-9">
                </div>
                <div class="col-3">
                <button class="btn btn-outline-black" type="button" id="btn-checkin" > 등록 </button>
                </div>
            </div>

        </div>

    </div>
</div>
</main>
        <!-- Footer Section Begin -->
        <c:import url="../temp/footer.jsp"></c:import>
        <!-- Footer Section End -->
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/stockSetting.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('.plusbtn').click(function() {
            let currentRow = $(this).closest('tr');
            let rowId = currentRow.attr('id');
            let stockLabel = $('#' + 'stockLabel' + rowId.replace('row', ''));
            let currentStock = parseInt(stockLabel.text());
            let maxStock = parseInt(currentRow.attr('data-max-stock'));

            if(currentStock < maxStock) {
                currentStock++;
                stockLabel.text(currentStock);
            }
        });

        $('.minusbtn').click(function() {
            let currentRow = $(this).closest('tr');
            let rowId = currentRow.attr('id');
            let stockLabel = $('#' + 'stockLabel' + rowId.replace('row', ''));
            let currentStock = parseInt(stockLabel.text());

            if(currentStock > 0) {
                currentStock--;
                stockLabel.text(currentStock);
            }
        });
    });
</script>

</body>
</html>
