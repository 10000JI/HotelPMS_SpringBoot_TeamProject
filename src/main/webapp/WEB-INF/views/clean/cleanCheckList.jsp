<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="card-body">
        <c:forEach var="request" items="${request}">
            <c:if test="${request2.roomStatus eq '청소요청'}">
                <c:forEach var="request2" items="${request.reservedVOS}">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <div class="d-flex align-items-center flex-shrink-0 me-3">
                            <div class="avatar avatar-xl me-3 bg-gray-200"><img
                                    class="avatar-img img-fluid"
                                    src="/assets/img/illustrations/profiles/profile-1.png" alt=""/>
                            </div>
                            <div class="d-flex flex-column fw-bold">
                                <div class="text-dark line-height-normal mb-1" href="#!">청소${request.scheduleNumber}팀</div>
                                <div class="small text-muted line-height-normal">${request2.roomNumber}</div>
                            </div>
                        </div>
                        <div class="dropdown no-caret">
                            <button class="btn btn-transparent-dark btn-icon dropdown-toggle"
                                    id="dropdownPeople1" type="button" data-bs-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false"><i
                                    data-feather="more-vertical"></i></button>
                            <div class="dropdown-menu dropdown-menu-end animated--fade-in-up"
                                 aria-labelledby="dropdownPeople1">
                                <a class="dropdown-item" href="#!" onclick="CleaningInProgress('${request2.roomNumber}')">청소시작</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${request2.roomStatus eq '청소중'}">
                <c:forEach var="request2" items="${request.reservedVOS}">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <div class="d-flex align-items-center flex-shrink-0 me-3">
                            <div class="avatar avatar-xl me-3 bg-gray-200"><img
                                    class="avatar-img img-fluid"
                                    src="/assets/img/illustrations/profiles/profile-1.png" alt=""/>
                            </div>
                            <div class="d-flex flex-column fw-bold">
                                <div class="text-dark line-height-normal mb-1" href="#!">청소${request.scheduleNumber}팀</div>
                                <div class="small text-muted line-height-normal">${request2.roomNumber}</div>
                            </div>
                        </div>
                        <div class="dropdown no-caret">
                            <button class="btn btn-transparent-dark btn-icon dropdown-toggle"
                                    id="dropdownPeople1-2" type="button" data-bs-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false"><i
                                    data-feather="more-vertical"></i></button>
                            <div class="dropdown-menu dropdown-menu-end animated--fade-in-up"
                                 aria-labelledby="dropdownPeople1">
                                <a class="dropdown-item" href="#!" onclick="CleaningComplete('${request2.roomNumber}')">청소완료</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </c:forEach>
    </div>
