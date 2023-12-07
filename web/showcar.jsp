<%-- 
    Document   : showcar
    Created on : Aug 23, 2023, 3:02:47 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!--=============== FAVICON ===============-->
        <link
            rel="shortcut icon"
            href="assets/img/favicon.png"
            type="image/z-icon"
            />

        <!--=============== REMIX ICONS ===============-->
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css"
            rel="stylesheet"
            />

        <!--=============== SWIPER CSS ===============-->
        <link rel="stylesheet" href="assets/css/swiper-bundle.min.css" />

        <!--=============== CSS ===============-->
        <link rel="stylesheet" href="assets/css/styles.css"/>
        <title>Carz</title>
    </head>
    <body>
        <!--==================== VARIABLE ====================-->
        <c:set var="user" value="${sessionScope.currentUser}"/>
        <c:set var="list" value="${sessionScope.list}"/>
        <!--==================== HEADER ====================-->

        <header class="header" id="header">
            <nav class="nav container">
                <a href="#" class="nav__logo">
                    <i class="ri-steering-line"></i>
                    Carz
                </a>

                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item">
                            <a href="index.jsp" class="nav__link active-link" onclick="scrollToSection('home')"> Home </a>
                        </li>
                        <li class="nav__item">
                            <a href="index.jsp" class="nav__link" onclick="scrollToSection('about')"> About </a>
                        </li>
                        <li class="nav__item">
                            <a href="index.jsp" class="nav__link" onclick="scrollToSection('popular')"> Popular </a>
                        </li>
                        <li class="nav__item">
                            <a href="index.jsp" class="nav__link" onclick="scrollToSection('featured')"> Featured </a>
                        </li>
                        <li class="nav__item">
                            <a href="DispatchServlet?action=showshop" class="nav__link">Car</a>
                        </li>
                        <c:if test="${user == null}">
                            <li class="nav__item">
                                <a href="DispatchServlet?action=login" class="nav__link">Login</a>
                            </li>
                        </c:if>
                        <c:if test="${user != null}">
                            <li class="nav__item">
                                <a href="DispatchServlet?action=logout" class="nav__link">Logout</a>
                            </li>
                            <li class="nav__item">
                                <a href="DispatchServlet?action=viewcart" class="nav__link"><i class="ri-shopping-cart-line"></i></a>
                            </li>
                        </c:if>
                    </ul>

                    <div class="nav__close" id="nav-close">
                        <i class="ri-close-line"></i>
                    </div>
                </div>

                <!--Toggle button-->
                <div class="nav__toggle" id="nav-toggle">
                    <i class="ri-menu-line"></i>
                </div>
            </nav>
            <div id="popup" class="popup">
                <p>Add Success</p>
            </div>
        </header>
        <!--==================== MAIN ====================-->
        <main class="main">
            <!--==================== FEATURED ====================-->
            <section class="featured section">
                <h2 class="section__title">
                    Choose Your Car
                </h2>

                <div class="featured__container containter">
                    <ul class="featured__filters">
                        <li>
                            <button class="featured__item active-featured" data-filter="all">
                                <span>All</span>
                            </button>
                        </li>
                        <li>
                            <button class="featured__item" data-filter=".Tesla">
                                <img src="assets/img/logo3.png" alt="">
                            </button>
                        </li>
                        <li>
                            <button class="featured__item" data-filter=".Audi">
                                <img src="assets/img/logo2.png" alt="">
                            </button>
                        </li>
                        <li>
                            <button class="featured__item" data-filter=".Porsche">
                                <img src="assets/img/logo1.png" alt="">
                            </button>
                        </li>
                    </ul>

                    <div class="featured__content grid">
                        <c:if test="${list != null}">
                            <c:forEach var="car" items="${list}">
                                <form action="DispatchServlet" method="POST">
                                    <article class="featured__card mix ${car.carCatogory}">
                                        <div class="shape shape__smaller"></div>

                                        <h1 class="featured__title">${car.carCatogory}</h1>

                                        <h3 class="featured__subtitle">${car.carName}</h3>

                                        <img src="${car.image}" alt="" class="featured__img">

                                        <h3 class="featured__price">${car.carPrice} $</h3>

                                        <input type="hidden" name="id" value="${car.carId}">
                                        <input type="hidden" name="page" value="shop">


                                        <button class="button featured__button" onclick="showPopup()">
                                            <i class="ri-shopping-bag-2-line">
                                                <input type="hidden" name="action" value="buy">
                                            </i>
                                        </button>
                                    </article>
                                </form>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </section>
            <!--==================== LOGOS ====================-->
            <section class="logos section">
                <div class="logos__container container grid">
                    <div class="logos__content">
                        <img src="assets/img/logo1.png" alt="" class="logos__img">
                    </div>
                    <div class="logos__content">
                        <img src="assets/img/logo2.png" alt="" class="logos__img">
                    </div>
                    <div class="logos__content">
                        <img src="assets/img/logo3.png" alt="" class="logos__img">
                    </div>
                    <div class="logos__content">
                        <img src="assets/img/logo4.png" alt="" class="logos__img">
                    </div>
                    <div class="logos__content">
                        <img src="assets/img/logo5.png" alt="" class="logos__img">
                    </div>
                    <div class="logos__content">
                        <img src="assets/img/logo6.png" alt="" class="logos__img">
                    </div>
                </div>
            </section>
        </main>

        <!--==================== FOOTER ====================-->
        <footer class="footer section">
            <div class="shape shape__big"></div>
            <div class="shape shape__small"></div>

            <div class="footer__container container grid">
                <div class="footer__content">
                    <a href="#" class="footer__logo">
                        <i class="ri-steering-line"></i> Carz
                    </a>

                    <p class="footer__description">
                        We offer the best electric cars of <br> 
                        the most recognized brands in <br> 
                        the world.
                    </p>
                </div>

                <div class="footer__content">
                    <h3 class="footer__title">
                        Company
                    </h3>
                    <ul class="footer__links">
                        <li>
                            <a href="#" class="footer__link">
                                About
                            </a>
                        </li>
                        <li>
                            <a href="#" class="footer__link">
                                Cars
                            </a>
                        </li>
                        <li>
                            <a href="#" class="footer__link">
                                History
                            </a>
                        </li>
                        <li>
                            <a href="#" class="footer__link">
                                Shop
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="footer__content">
                    <h3 class="footer__title">
                        Information
                    </h3>
                    <ul class="footer__links">
                        <li>
                            <a href="#" class="footer__link">
                                Request a quote
                            </a>
                        </li>
                        <li>
                            <a href="#" class="footer__link">
                                Find a dealer
                            </a>
                        </li>
                        <li>
                            <a href="#" class="footer__link">
                                Contact us
                            </a>
                        </li>
                        <li>
                            <a href="#" class="footer__link">
                                Services
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="footer__content">
                    <h3 class="footer__title">
                        Follow us
                    </h3>
                    <ul class="footer__social">
                        <a href="https://www.facebook.com/" target="_blank" class="footer__social-link">
                            <i class="ri-facebook-fill"></i>
                        </a>
                        <a href="https://www.instagram.com/" target="_blank" class="footer__social-link">
                            <i class="ri-instagram-line"></i>
                        </a>
                        <a href="https://twitter.com/" target="_blank" class="footer__social-link">
                            <i class="ri-twitter-x-line"></i>
                        </a>
                    </ul>
                </div>
            </div>
        </footer>

        <!--========== SCROLL UP ==========-->
        <a href="#" class="scrollup" id="scroll-up">
            <i class="ri-arrow-up-line"></i>
        </a>
        <!--=============== SCROLL REVEAL ===============-->
        <script src="assets/js/scrollreveal.min.js"></script>

        <!--=============== SWIPER JS ===============-->
        <script src="assets/js/swiper-bundle.min.js"></script>

        <!--=============== MIXITUP JS ===============-->
        <script src="assets/js/mixitup.min.js"></script>

        <!--=============== MAIN JS ===============-->
        <script src="assets/js/main.js"></script>
    </body>
</html>