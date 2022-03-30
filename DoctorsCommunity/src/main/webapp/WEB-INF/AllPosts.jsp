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
    <title>posts page</title>
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
        <div class="col-6 mt-5">
          <div class="header">
            <h1>Doctor's Community</h1>
            <h3>Hi, <c:out value="${currentUser.username}"></c:out></h3>
          </div>
          <div class="row justify-content-between">
          	 <div class="col-10">
				<c:forEach items="${posts}" var="post">
					<div style="border:solid 3px; border-radius:15px; height: 150px;">
						<h2><c:out value="${post.postUser.username}"></c:out></h2>
						<h6><c:out value="${post.createdAt}"></c:out></h6>
						<p><c:out value="${post.description}"></c:out></p>
					</div>
				</c:forEach>       
          	 </div>
          </div>
        </div>
        <div class="col-3  text-center mt-5 " style="display: flex; flex-direction: column;" >
            <h5>Featured Categories</h5>
            <a class="btn btn-info mb-1" href="#" role="button"
              >link to random posts</a
            >
            <a class="btn btn-info mb-1" href="#" role="button"
              >link to random posts</a
            >
            <a class="btn btn-info mb-1" href="#" role="button"
              >link to random posts</a
            >
        </div>
      </div>
    
      <div class="footer bg-secondary mt-3">
        <footer class="text-center text-lg-start text-white">
          <!-- Grid container -->
          <div class="container">
            <!-- Section: Links -->
            <section class="">
              <!--Grid row-->
              <div class="row">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                  <h6 class="text-uppercase mb-4 font-weight-bold">
                    Company name
                  </h6>
                  <p>
                    Here you can use rows and columns to organize your footer
                    content. Lorem ipsum dolor sit amet, consectetur adipisicing
                    elit.
                  </p>
                </div>
              </div>
            </section>
          </div>
        </footer>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>