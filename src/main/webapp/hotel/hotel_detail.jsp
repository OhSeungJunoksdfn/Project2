<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.two .pricec {
	font-size: 16px;
}
</style>
</head>
<body>
<!-- 시작 -->
<!-- 사이드바 Start -->
	<section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        	<div class="col-lg-3 order-md-last sidebar pt-3 shadow" id="sidebar">
        		<div class="sidebar-wrap ftco-animate">
        			<h3 class="heading mb-4">Find City</h3>
        			<form action="#">
        				<div class="fields">
		              <div class="form-group">
		                <input type="text" class="form-control" placeholder="Destination, City">
		              </div>
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="" id="" class="form-control" placeholder="Keyword search">
	                      <option value="">Select Location</option>
	                      <option value="">San Francisco USA</option>
	                      <option value="">Berlin Germany</option>
	                      <option value="">Lodon United Kingdom</option>
	                      <option value="">Paris Italy</option>
	                    </select>
	                  </div>
		              </div>
		              <div class="form-group">
		                <input type="text" id="checkin_date" class="form-control" placeholder="Date from">
		              </div>
		              <div class="form-group">
		                <input type="text" id="checkin_date" class="form-control" placeholder="Date to">
		              </div>
		              <div class="form-group">
		              	<div class="range-slider">
		              		<span>
										    <input type="number" value="25000" min="0" max="120000"/>	-
										    <input type="number" value="50000" min="0" max="120000"/>
										  </span>
										  <input value="1000" min="0" max="120000" step="500" type="range"/>
										  <input value="50000" min="0" max="120000" step="500" type="range"/>
										</div>
		              </div>
		              <div class="form-group">
		                <input type="submit" value="Search" class="btn btn-primary py-3 px-5">
		              </div>
		            </div>
	            </form>
        		</div>
        		<div class="sidebar-wrap ftco-animate">
        			<h3 class="heading mb-4">Star Rating</h3>
        			<form method="post" class="star-rating">
							  <div class="form-check">
									<input type="checkbox" class="form-check-input" id="exampleCheck1">
									<label class="form-check-label" for="exampleCheck1">
										<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
									</label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						    	   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						     </label>
							  </div>
							  <div class="form-check">
							    <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
							    </label>
							  </div>
							</form>
        		</div>
          </div>
 <!-- 사이드바 End -->
          <div class="col-lg-9">
          	<div class="row mr-2 sidebar shadow pt-3">
          		<div class="col-md-12 ftco-animate ">
          			<div class="single-slider owl-carousel">
          			   <c:forEach items="${iList }" var="img">
          					<div class="hotel-img r-12" style="background-image:none; ">
          					  <img src="${img.img_og}" style="width: 100%; height: 100%;">
          					</div>
          			   </c:forEach>
          			</div>
          		</div>
          	  
          		<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
          			<h2>${vo.title }</h2>
          			<p class="rate mb-5">
          				<span class="loc"><a href="#"><i class="icon-map"></i> ${vo.addr }</a></span>
          				<span class="star">
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star-o"></i>
    					</span>

    				</p>
    				<div class="d-md-flex mt-5 mb-5">
    					<ul>
	    					<li>The Big Oxmox advised her not to do so</li>
	    					<li>When she reached the first hills of the Italic Mountains</li>
	    					<li>She had a last view back on the skyline of her hometown </li>
	    					<li>Bookmarksgrove, the headline of Alphabet </li>
	    				</ul>
	    				<ul class="ml-md-5">
	    					<li>Question ran over her cheek, then she continued</li>
	    					<li>Pityful a rethoric question ran</li>
	    					<li>Mountains, she had a last view back on the skyline</li>
	    					<li>Headline of Alphabet Village and the subline</li>
	    				</ul>
    				</div>
    						<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
          		</div>
          		
          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
          			<h4 class="mb-4">객실 선택</h4>
          				<div class="row px-3">
							<div class="col-md-4">
				    			<div class="destination">
				    				  <c:forEach items="${rList }" var="room">
				    					<a href="#" class="img img-2 r-12" style="background-image:none; ">
				    					  <img src="${room.room_img }">
				    					</a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">${room.title }</a></h3>
						    						<p class="rate">
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star-o"></i>
						    							<span></span>
						    						</p>
					    						</div>
					    						<div class="two">
					    						  <span class="price" style="font-size: 16px;">
					    						    <fmt:formatNumber value="${room.price}" type="number" groupingUsed="true"/>원
					    						    <br><small>/ 1박</small>					    							
				    							  </span>
				    							</div>
				    						</div>
				    						<p>${room.person }인 / 최대 ${room.person_max}인</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span class="ml-auto"><a href="#">객실 예약</a></span>
				    						</p>
				    					</div>
				    				</c:forEach>
				    			</div>
				    		</div>
          				</div>
          		</div>

				<!-- 댓글-->
				<section class="ftco-section-parallax">
				      <div class="container">
				        <div class="row">
				          <h3 class="col-12 mb-5">6 Comments</h3>
				          <div class="col-12">
				            <ul class="comment-list">
				              <li class="comment">
				                <div class="vcard bio">
				                  <img src="#" alt="Image placeholder" />
				                </div>
				                <div class="comment-body">
				                  <h3>John Doe</h3>
				                  <div class="meta">October 03, 2018 at 2:21pm</div>
				                  <p>
				                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				                    Pariatur quidem laborum necessitatibus, ipsam impedit vitae
				                    autem, eum officia, fugiat saepe enim sapiente iste iure!
				                    Quam voluptas earum impedit necessitatibus, nihil?
				                  </p>
				                  <p><a href="#" class="reply">Reply</a></p>
				                </div>
				              </li>
				            </ul>
				          </div>
				          <h3 class="ml-3">댓글입력</h3>
				          <div class=" container input-group mb-3">
				            <textarea
				              class="form-control"
				              placeholder="Recipient's username"
				              aria-label="Recipient's username"
				              aria-describedby="button-addon2"
				              style="resize: none; height: 100px !important; border-radius: 12px 0 0 12px"
            				></textarea>
           					 <button class="replyBtn" style="border-radius: 0 12px 12px 0">댓글</button>
				          </div>
				        </div>
				      </div>
				    </section>
				  <!--댓글 끝-->

				  <!--추천-->
				  <div class="col-md-12 hotel-single ftco-animate mb-5 mt-5">
					<h4 class="mb-4">${vo.title }와(과) 비슷한 추천 숙소</h4>
					<div class="row">
					  <div class="col-md-4">
								  <div class="destination">
									  <a href="hotel-single.html" class="img img-2 r-12" style="background-image: "></a>
									  <div class="text p-3">
										  <div class="d-flex">
											  <div class="one">
												  <h3><a href="hotel-single.html">Hotel, Italy</a></h3>
												  <p class="rate">
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star"></i>
													  <i class="icon-star-o"></i>
													  <span>8 Rating</span>
												  </p>
											  </div>
											  <div class="two">
												  <span class="price per-price">$40<br><small>/night</small></span>
											  </div>
										  </div>
										  <p>Far far away, behind the word mountains, far from the countries</p>
										  <hr>
										  <p class="bottom-area d-flex">
											  <span><i class="icon-map-o"></i> Miami, Fl</span> 
											  <span class="ml-auto"><a href="#">Book Now</a></span>
										  </p>
									  </div>
								  </div>
							  </div>
					</div>
				</div>
				<!--추천끝-->

          	</div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->
</body>
</html>