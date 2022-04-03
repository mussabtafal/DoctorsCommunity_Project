<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <link rel="stylesheet" type="text/css" href="/css/allPosts.css">
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Posts page</title>
  </head>
  <body>
  	<div class="container-fluid">
  	   <div class="row">
    <nav class="navbar navbar-expand-lg bg-secondary" style="display: flex; justify-content: space-between;">
        <div class="logo">
            <a class="navbar-brand" href="/"><img alt="" src="/img/logoBLUE.jpg"  height="40px" style="border-radius: 7px;"></a>
        </div>
        <div class="otherbtns" style="display:flex;">
        	<div>
            <a href="/" class="btn btn-primary ">Home</a>
            <c:forEach items="${userRole.roles}" var="role">
            	 <c:if test="${role.id == 1}">
                   <c:set var="patient" value="${true}"/>
               	 </c:if>
      		</c:forEach> 
      		<c:choose>
               <c:when test="${patient == true}">
                       <a href="/user/${currentUser.id}" class="btn btn-primary ">profile</a>
               </c:when>
               <c:otherwise>
                      <a href="/doctor/${currentUser.id}" class="btn btn-primary ">profile</a>
               </c:otherwise>
           </c:choose>
        	</div>
             <form id="logoutForm" method="POST" action="/logout">
		        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		        <input type="submit" value="Logout!" class="btn btn-danger ms-1" />
	    	 </form>
        </div>
    </nav>
     </div>
      <div class="row pt-5">
      	<div class="col-6">
      		<h1>Doctor's Community</h1>
      		<h3>Welcome, <c:out value="${currentUser.username}"></c:out></h3>
      	</div>
      	<div class="col-3">
      		<c:forEach items="${userRole.roles}" var="role">
            	 <c:if test="${role.id == 1}">
                   <c:set var="patient" value="${true}"/>
               	 </c:if>
      		</c:forEach> 
      		<c:choose>
               <c:when test="${patient == true}">
      				<a href="/posts/new"><button type="button" class="btn btn-outline-secondary mt-4" style="width:200px;">New Post</button></a>
               </c:when>
               <c:otherwise>
                      <a href="/doctor/${currentUser.id}" class="btn btn-outline-secondary mt-4 ">Check Your Previous Advises</a>
               </c:otherwise>
           </c:choose>
      	</div>
      </div>
      <div class="row justify-content-between p-3">
      		<div class="col-8 overflow-auto border border-dark" style="height:600px; border-radius:10px;">
      		   	<c:forEach items="${posts}" var="post">
					<div class="m-3 p-2 overflow-auto" style="border:solid 2px LightGray; border-radius:15px; height: 150px;">
						<h3 class="text-start"><span style="font-size:15px; color:Gray;">Posted by:</span> <c:out value="${post.postUser.username}">
						</c:out> <span style="font-size:15px; color:Gray;">on <fmt:formatDate value="${post.createdAt}" type="date" pattern="dd-MMM-yyyy"/></span></h3>
						<p style="font-size:20px;"><c:out value="${post.description}"></c:out></p>
					</div>
					<div class="row text-end me-2">
						<a href="/posts/${post.id}"><button type="button" class="btn btn-outline-secondary">Advise</button></a>
					</div>
				</c:forEach>    
          	</div>
      		<div class="col-3 text-center" style="height:200px;">
	     	   <h5 class="me-5">Featured Categories</h5>
	           <a class="btn btn-primary mb-1" style ="height:40px; width: 250px" href="/category/Cardiac" role="button">link to Cardiac conditions</a>
	           <a class="btn btn-primary mb-1" style ="height:40px; width: 250px" href="/category/Respiratory" role="button">link to Respiratory conditions</a>
	           <a class="btn btn-primary mb-1" style ="height:40px; width: 250px" href="/category/gastrologic" role="button">link to gastrological conditions</a>
	           <a class="btn btn-primary mb-1" style ="height:40px; width: 250px" href="/category/Orthopedic" role="button">link to Orthopedic conditions</a>
	           <a class="btn btn-primary mb-1" style ="height:40px; width: 250px" href="/category/Genital " role="button">link to Genital conditions</a>
	           <a class="btn btn-primary mb-1" style ="height:40px; width: 250px" href="/category/Musculoskeletal" role="button">link to Musculoskeletal condtions</a>
	           <a class="btn btn-primary mb-1" style ="height:40px; width: 250px" href="/category/Dermatologic" role="button">link to Dermatological conditions</a>
	           <a class="btn btn-primary mb-1" style ="height:40px; width: 250px" href="/category/Urologic" role="button">link to Urological conditions</a>
      		</div>
       </div>
  	</div>
     <footer class="text-center text-lg-start text-white bg-secondary mt-4" >
                <div class="container p-4 pb-0">
                    <section class="">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">
                                    Doctor Community
                                </h6>
                                <p>
                                    Our site is a community-based web application with the main purpose exchanging knowledge between members, help raising medical awareness.
                                    Users can register to the platform and share the medical cases and a team of registered doctors can help them by advising, approaching members or refer them to nearby specialist Doctors, Hospital or Clinics.
                                </p>
                            </div>
                            <hr class="w-100 clearfix d-md-none" />
                            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">Our Partners</h6>
                                <p>
                                    <a class="text-white">MOH</a>
                                </p>
                                <p>
                                    <a class="text-white">AHA</a>
                                </p>
                                <p>
                                    <a class="text-white">COVID-19 Tracker</a>
                                </p>
                            </div>
                            <hr class="w-100 clearfix d-md-none" />
                            <hr class="w-100 clearfix d-md-none" />
                            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">Contact Us</h6>
                                <p><i class="fas fa-home mr-3"></i> Ramalla, Axsos Academy</p>
                                <p><i class="fas fa-envelope mr-3"></i> doctorcommunity@mail.com</p>
                                <p><i class="fas fa-phone mr-3"></i> 05 234 567 88</p>
                                <p><i class="fas fa-print mr-3"></i> 05 234 567 89</p>
                            </div>
                 <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                     <h6 class="text-uppercase mb-4 font-weight-bold">Follow us</h6>
                     <!-- Facebook -->
                      <img alt="" src="/img/facebook-logo.jpg"  height="40px" style="border-radius: 7px;">
                     <!-- Twitter -->
                       <a class="btn btn-floating m-1 bg-secondary" href="#"
                         role="button"><img alt="" src="/img/Twitter.png"  height="40px" style="border-radius: 7px;"></a>
                     <!-- Linkedin -->
                     <img alt="" src="/img/linked.png"  height="40px" style="border-radius: 7px;">
                     <!-- Github -->
                    <a class="btn btn-floating m-1 bg-secondary" href="#"
                         role="button"><img alt="" src="/img/github.png"  height="40px" width="40px" style="border-radius: 7px;"></a>
                        </div>
                    </section>
                </div>
                <!-- Copyright -->
                <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
                    © 2022 Copyright:
                    <a class="text-white" href="#">www.doctorcommunity.com</a>
                </div>
            </footer>  		
  </body>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
</html>