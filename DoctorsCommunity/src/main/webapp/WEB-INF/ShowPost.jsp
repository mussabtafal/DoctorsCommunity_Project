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
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Posts page</title>
  </head>
  <body>
  	<div class="container-fluid">
  <div class="row">
       <div class="nav-container bg-secondary">
         <nav class="navbar navbar-expand-lg navbar-light">
           <div class="container-fluid">
             <a class="navbar-brand" href="#">LOGO</a>
             <button
               class="navbar-toggler"
               type="button"
               data-bs-toggle="collapse"
               data-bs-target="#navbarTogglerDemo02"
               aria-controls="navbarTogglerDemo02"
               aria-expanded="false"
               aria-label="Toggle navigation"
             >
               <span class="navbar-toggler-icon"></span>
             </button>
             <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
               <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                 <li class="nav-item">
                   <a class="nav-link active" aria-current="page" href="#"
                     >Home</a
                   >
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" aria-current="page" href="#"
                     >Register</a
                   >
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" aria-current="page" href="#">Section</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" aria-current="page" href="#"
                     >About us</a
                   >
                 </li>
               </ul>
               <form class="d-flex">
                 <input
                   class="form-control me-2"
                   type="search"
                   placeholder="Search"
                   aria-label="Search"
                 />
                 <button class="btn btn-outline-success" type="submit">
                   Search
                 </button>
               </form>
             </div>
           </div>
         </nav>
       </div>
     </div>
     <div class="row">
     		<h1 class="my-5">Doctor's Community</h1>
     		<div class="col-8 justify-content-between" style="display:flex;">
     			<h2>Title: <c:out value="${post.title}"></c:out></h2>
     			<h2>Category: <c:out value="${post.category}"></c:out></h2>
     			<h2>Patient: <c:out value="${post.postUser.username}"></c:out></h2>
     		</div>
     		<div class="col-8">
     			<div class= "overflow-auto p-5 " style="height:auto; border: 2px solid black; border-radius: 15px;">
     				<p style="font-size: 25px;"><c:out value="${post.description}"></c:out></p>
     				<form:form action="/posts/${post.id}" method="post" modelAttribute="postComment">
  					<form:input type="hidden" path="commentPost" value="${post.id}"/>
     				<form:input type="hidden" path="commentUser" value="${currentUser.id}"/>
     					<div class="form-floating">
							<form:textarea path="content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></form:textarea>
							<form:label path="content" for="floatingTextarea2">Comment</form:label>
						</div>
						<div class="row justify-content-end">
							<button type="submit" class="btn btn-outline-secondary col-1 my-4 me-3">Advise</button>
						</div>
     				</form:form>
     				<div class="p-5 overflow-auto" style="height:400px; border: 2px solid black; border-radius: 15px;">
    				<c:forEach items="${comments}" var="comment">
     					<div class="overflow-auto p-3" style="height:150px; border: 2px solid black; border-radius: 15px;">
							<p style="font-size: 25px;"><c:out value="${comment.content}"></c:out></p>
     					</div>
					</c:forEach> 
     				</div>
     			</div>
     		</div>  		
     		<div class="col-8">
     			
     		</div>
     </div>
   </div>
</body>
</html>