<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <title>Hello, world!</title>
</head>

<body>
    <div class="container-fluid mb-2">
        <div class="row">
            <div class="col-12">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">Navbar</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">logo</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " aria-current="page" href="#">Register</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " aria-current="page" href="#">Section</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " aria-current="page" href="#">About us</a>
                                </li>
                            </ul>
                            <form class="d-flex">
                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success" type="submit">Search</button>
                            </form>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="row">
            <h1>Doctors Community !</h1>
        </div>
        <div class="row">
            <h4>are you ok? please post your condition, let us help you !</h4>
        </div>
        <h2> <c:out value="${currentUser.username}"></c:out></h2>
        <div class="row justify-content-end">
            <form:form action="/posts/new" method="post" modelAttribute="post">
            <form:input type="hidden" path="postUser" value="${currentUser.id}"/>
            <div class="col-7">
                    <div class="col-12">
                        <form:errors path="description"/>
                        <form:textarea path="description" cols="117" rows="10"></form:textarea>
                    </div>               
                <div class="row">
                    <div class="row g-3">
                        <div class="col-sm-7">
                            <form:input path="title"  type="text" class="form-control" placeholder="title" aria-label="title"/>
                        </div>
                        <div class="col-sm">
                            <form:select path="category" class="form-select" aria-label="Default select example">
                                <form:option value="testt">One</form:option>
                                <form:option value="testt">Two</form:option>
                                <form:option value="testt">Three</form:option>
                            </form:select>
                        </div>
                        <div class="col-sm">
                            <form:errors path="photo"/>
                            <form:input class="form-control" type="file" path="photo"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2" style="margin: 1rem 0;">
                    	<input type="submit" value="submit"></div>
                	</div>
            	</div>
         </form:form>
            <div class="col-4 align-self-end text-center ">
                <h4>Featured Categories</h4>
                <p><a href="#">Link to Category post</a></p>
                <p><a href="#">Link to Category post</a></p>
                <p><a href="#">Link to Category post</a></p>
                <p><a href="#">Link to Category post</a></p>
            </div>
        </div>
        <div class="row">
            <div class="col-8 mt-3">
                <div class="row">
                    <div class="col-4 "> <img src="https://images.unsplash.com/photo-1617526795282-054cecafa373?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=469&q=80" alt="hjh"
                            class="img-fluid"></div>
                    <div class="col-4"> <img src="https://images.unsplash.com/photo-1617526795282-054cecafa373?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=469&q=80" alt="hjh"
                            class="img-fluid"></div>
                    <div class="col-4"> <img src="https://images.unsplash.com/photo-1617526795282-054cecafa373?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=469&q=80" alt="hjh"
                            class="img-fluid"></div>
                </div>
            </div>
            <div class="col-4 mx-auto " style="max-width: 400px;">
                <h4 class="ms-3">Featured Categories</h4>
                <p class="ms-5"><a href="#">Link to Category post</a></p>
                <p class="ms-5"><a href="#">Link to Category post</a></p>
                <p class="ms-5"><a href="#">Link to Category post</a></p>
                <p class="ms-5"><a href="#">Link to Category post</a></p>
            </div>
        </div>
        <!-- Remove the container if you want to extend the Footer to full width. -->
            <!-- Footer -->
            <footer class="text-center text-lg-start text-white" style="background-color: #929fba">
                <!-- Grid container -->
                <div class="container p-4 pb-0">
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
                            <!-- Grid column -->

                            <hr class="w-100 clearfix d-md-none" />

                            <!-- Grid column -->
                            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">Products</h6>
                                <p>
                                    <a class="text-white">MDBootstrap</a>
                                </p>
                                <p>
                                    <a class="text-white">MDWordPress</a>
                                </p>
                                <p>
                                    <a class="text-white">BrandFlow</a>
                                </p>
                                <p>
                                    <a class="text-white">Bootstrap Angular</a>
                                </p>
                            </div>
                            <!-- Grid column -->

                            <hr class="w-100 clearfix d-md-none" />

                            <!-- Grid column -->
                            <hr class="w-100 clearfix d-md-none" />

                            <!-- Grid column -->
                            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
                                <p><i class="fas fa-home mr-3"></i> New York, NY 10012, US</p>
                                <p><i class="fas fa-envelope mr-3"></i> info@gmail.com</p>
                                <p><i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
                                <p><i class="fas fa-print mr-3"></i> + 01 234 567 89</p>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">Follow us</h6>

                                <!-- Facebook -->
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #3b5998" href="#!"
                                    role="button"><i class="fab fa-facebook-f"></i></a>

                                <!-- Twitter -->
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #55acee" href="#!"
                                    role="button"><i class="fab fa-twitter"></i></a>

                                <!-- Google -->
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #dd4b39" href="#!"
                                    role="button"><i class="fab fa-google"></i></a>

                                <!-- Instagram -->
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #ac2bac" href="#!"
                                    role="button"><i class="fab fa-instagram"></i></a>

                                <!-- Linkedin -->
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #0082ca" href="#!"
                                    role="button"><i class="fab fa-linkedin-in"></i></a>
                                <!-- Github -->
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #333333" href="#!"
                                    role="button"><i class="fab fa-github"></i></a>
                            </div>
                        </div>
                        <!--Grid row-->
                    </section>
                    <!-- Section: Links -->
                </div>
                <!-- Grid container -->

                <!-- Copyright -->
                <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
                    © 2020 Copyright:
                    <a class="text-white" href="https://mdbootstrap.com/">MDBootstrap.com</a>
                </div>
                <!-- Copyright -->
            </footer>
            <!-- Footer -->
        <!-- End of .container -->
    </div>
     <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
</body>

</html>