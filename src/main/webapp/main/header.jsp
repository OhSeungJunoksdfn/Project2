<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>Insert title here</title>
</head>
<body>
<nav
      class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
      id="ftco-navbar"
    >
      <div class="container">
        <a class="navbar-brand" href="../main/main.do">Adventure</a>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#ftco-nav"
          aria-controls="ftco-nav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a href="../main/main.do" class="nav-link">Home</a>
            </li>
            <li class="nav-item">
              <a href="../air/air_list.do" class="nav-link">Places</a>
            </li>
            <li class="nav-item">
              <a href="../hotel/hotel_list.do" class="nav-link">Hotels</a>
            </li>
            <li class="nav-item">
              <a href="../car/car_list.do" class="nav-link">Car rentals</a>
            </li>
            <li class="nav-item">
              <a href="../board/list.do" class="nav-link">Community</a>
            </li>
            <li class="nav-item">
              <a href="../customer/main.do" class="nav-link">Support</a>
            </li>
            <c:if test="${sessionScope.id != null }">
            <li class="nav-item">
              <a href="../mypage/main.do" class="nav-link">Account</a>
            </li>
            </c:if>
            <c:if test="${sessionScope.id == null }">
            <li class="nav-item">
              <a href="../member/login.do" class="nav-link" >Login</a>
            </li>
            </c:if>
            <c:if test="${sessionScope.id != null }">
            <li class="nav-item">
              <a href="../member/logout.do" class="nav-link" >Logout</a>
            </li>
            </c:if>
          </ul>
        </div>
        
      </div>
    </nav>
  <c:if test="${main_jsp=='../main/home.jsp' }">
<div
      class="hero-wrap js-fullheight"
      style="background-image: url('../images/bg_1.jpg')"
    >
      <div class="container">
        <div
          class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
          data-scrollax-parent="true"
        >
          <div
            class="col-md-9 ftco-animate mb-5 pb-5 text-center text-md-left"
            data-scrollax=" properties: { translateY: '70%' }"
          >
            <h1
              class="mb-4"
              data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"
            >
               Escape to<br />Jeju Island
            </h1>
            <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
              Explore the island's best spots for food, nature, and culture
            </p>
          </div>
        </div>
      </div>
    </div>
   </c:if>
     <c:if test="${main_jsp!='../main/home.jsp' }">
<div
      class="hero-wrap"
      style="background-image: url('../images/bg_1.jpg'); height: 120px"
    >
    </div>
    </c:if>
    

</body>
</html>