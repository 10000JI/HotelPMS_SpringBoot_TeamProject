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
        table {
            display: flex;
            width: 100%;
        }
        td {
            flex: 1;
            text-align: center;
        }
        .datatable-table > thead > tr > th {
            vertical-align: bottom;
            text-align: center;
            border-bottom: none;
        }

        form {
            display: inline;
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
                <div class="col-12 col-lg-auto text-center text-lg-end">
                    <!-- button -->
                   <div class="h3 text-white">
                       <%--    <button class="btn btn-dark" type="button" id="btn-reset">초기화</button>
                          <form id="saveForm" action="/roomDetail/save" method="post">
                              <input type="hidden" name="checkoutDate" id="updateCheckout">
                              <input type="hidden" name="roomNumber" value="${bookingVO.roomNumber}">
                              <input type="hidden" name="reservationNumber" value="${bookingVO.reservationNumber}">
                              <input type="hidden" name="reservationDate" id="updateReservationDate">
                              <input type="hidden" name="guestCount" id="updateGuestCount">
                              <input type="hidden" name="pageName" value="${pageName}">
                              <button class="btn btn-dark" type="button" id="btn-save">저장</button>
                          </form>
                         &lt;%&ndash; <a href="#"><button class="btn btn-dark" type="button">문자발송</button></a>&ndash;%&gt;

                          <button class="btn btn-dark" type="button" data-bs-toggle="modal" data-bs-target="#exampleModalLg">문자발송</button>
                          <div class="modal fade" id="exampleModalLg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                              <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                  <div class="modal-content">
                                      <form id="sendForm" action="/smsMessage/ressend" method="post">
                                      <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">문자발송</h5>
                                          <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      <div class="modal-body">
                                          <div class="table-responsive">
                                              <div class="datatable-container d-flex justify-content-center align-items-center">
                                                  <table class="datatable-table" style="font-size: 15px; width: 90%;">
                                                      <thead>
                                                      <tr>
                                                          <td rowspan="3">발송내용</td>
                                                          <c:set var="differenceInDays" value="${((bookingVO.checkoutDate.time - bookingVO.checkinDate.time) / (1000 * 60 * 60 * 24)) + 1}" />
                                                          <td rowspan="3" style="width: 300px;">
                                                                <textarea cols="30" rows="5" name="resTextarea" id="resTextarea">
  ※예약안내※
                                                                    ${bookingVO.name}고객님.
  예약번호 : ${bookingVO.reservationNumber}
  객실번호 : ${bookingVO.roomNumber}
  인원수 : ${bookingVO.guestCount}
                                                                    ${fn:substringBefore(differenceInDays, '.')}박 예약 감사합니다.
  체크인 15시, 체크아웃 13시 입니다.
  추가 문의 사항은 연락바랍니다.
  -모호텔-
    </textarea>
                                                          </td>
                                                          <td>수신자</td>
                                                          <td><input type="text" readonly="readonly" name="name" value="${bookingVO.name}"></td>
                                                      </tr>
                                                      <tr>
                                                          <td>수신번호</td>
                                                          <td><input type="text" readonly="readonly" name="phoneNumber" value="${bookingVO.phoneNumber}"></td>
                                                      </tr>
                                                      <tr>
                                                          <td>발송일자</td>
                                                          <td><input type="text" readonly="readonly" value="${currentDate}"/></td>
                                                      </tr>
                                                      </thead>
                                                  </table>
                                              </div>
                                          </div>
                                      </div>
                                      <div class="modal-footer">
                                          <button class="btn btn-dark" type="button" data-bs-dismiss="modal">취소</button>
                                          <input type="hidden" name="pageName" value="${pageName}">
                                          <input type="hidden" name="roomNumber" value="${bookingVO.roomNumber}">
                                          <button class="btn btn-dark" type="button" id="btn-send">전송</button>
                                      </div>
                                      </form>
                                  </div>
                              </div>
                          </div>



                          <a href="#"><button class="btn btn-dark" type="button">알림톡발송</button></a>
                          <c:if test="${pageName eq '예약확정'}">
                          <form id="checkinForm" action="/roomDetail/checkInSave" method="post">
                             <input type="hidden" name="checkinDate" value="${bookingVO.checkinDate}">
                             <input type="hidden" name="checkoutDate" id="updateResCheckout">
                             <input type="hidden" name="roomNumber" value="${bookingVO.roomNumber}">
                                  <button class="btn btn-dark" type="button" id="btn-checkin">체크인</button>
                          </form>
                          </c:if>
                          <c:if test="${pageName eq '재실'}">
                          <form id="cleanAskForm" action="/roomDetail/cleanAskSave" method="post">
                              <input type="hidden" name="checkinDate" value="${bookingVO.checkinDate}">
                              <input type="hidden" name="checkoutDate" id="updateRoomCheckout">
                              <input type="hidden" name="roomNumber" value="${bookingVO.roomNumber}">
                                  <button class="btn btn-dark" type="button" id="btn-cleanask">청소요청</button>
                          </form>
                          </c:if>--%>
                      </div>
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
                <label style="margin-top: 30px; margin-bottom: 15px;">비품설정</label>
                <div class="datatable-container">

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
<script>
    $('#dropdownBtn').on('show.bs.dropdown', function () {
        //클릭하는 순간 하위 버튼들이 보여질 때
    })

    $('#dropdownBtn').on('shown.bs.dropdown', function () {
        //하위 버튼들이 다 보여지고 난 뒤
    })

    $('#dropdownBtn').on('hide.bs.dropdown', function () {
        //하위 버튼이 닫혔을 때
    })

    $('#dropdownBtn').on('hidden.bs.dropdown', function () {
        //하위 버튼이 닫힌 후
    })
</script>
</body>
</html>
