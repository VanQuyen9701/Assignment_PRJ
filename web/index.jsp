<%-- Document : index Created on : Aug 13, 2023, 12:00:36 AM Author : ACER --%>
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
        <c:set var="catogory" value="${requestScope.catogory}"/>
        <c:set var="msg" value="${requestScope.msg}"/>
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
                            <a href="#home" class="nav__link active-link"> Home </a>
                        </li>
                        <li class="nav__item">
                            <a href="#about" class="nav__link"> About </a>
                        </li>
                        <li class="nav__item">
                            <a href="#popular" class="nav__link"> Popular </a>
                        </li>
                        <li class="nav__item">
                            <a href="#featured" class="nav__link"> Featured </a>
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
            <!--==================== HOME ====================-->
            <section class="home section" id="home">
                <div class="shape shape__big"></div>
                <div class="shape shape__small"></div>
                <div class="home__container conainer grid">
                    <div class="home__data">
                        <c:if test="${user == null}" >
                            <h1 class="home__title">Choose The Best Car</h1>
                        </c:if>
                        <c:if test="${user != null}">
                            <h1 class="home__title">Welcome Back ${user.fullName}, Choose Your Best Car</h1>
                        </c:if>
                        <h2 class="home__subtitle">Porsche Mission E</h2>
                        <h3 class="home__elec">
                            <i class="ri-flashlight-fill"></i> Electric Car
                        </h3>
                    </div>
                    <img src="assets/img/home.png" alt="" class="home__img" />
                    <div class="home__car">
                        <div class="home__car-data">
                            <div class="home__car-icon">
                                <i class="ri-temp-cold-line"></i>
                            </div>
                            <h2 class="home__car-number">
                                <span id="temperature"></span>
                            </h2>
                            <h3 class="home__car-name">temperature</h3>
                        </div>
                        <div class="home__car-data">
                            <div class="home__car-icon">
                                <i class="ri-dashboard-3-line"></i>
                            </div>
                            <h2 class="home__car-number">873</h2>
                            <h3 class="home__car-name">MILEAGE</h3>
                        </div>
                        <div class="home__car-data">
                            <div class="home__car-icon">
                                <i class="ri-flashlight-fill"></i>
                            </div>
                            <h2 class="home__car-number">94%</h2>
                            <h3 class="home__car-name">Battery</h3>
                        </div>
                    </div>

                    <a href="#" class="home__button">START</a>
                </div>
            </section>

            <!--==================== ABOUT ====================-->
            <section class="about section" id="about">
                <div class="about__container container grid">
                    <div class="about__group">
                        <img src="assets/img/about.png" alt="" class="about__img" />
                        <div class="about__card">
                            <h3 class="about__card-title">2500+</h3>
                            <p class="about__card-description">
                                Supercharges placed along popular routes
                            </p>
                        </div>
                    </div>
                    <div class="about__data">
                        <h2 class="section__title about__title">
                            Machine with <br />
                            Future Technology
                        </h2>
                        <p class="about__description">
                            See the future with high-performance electric cars produced by
                            renowned brands. They feature futuristic builds and designs with
                            new and innovative platforms that last a long time.
                        </p>
                        <a href="#" class="button"> Know more </a>
                    </div>
                </div>
            </section>

            <!--==================== POPULAR ====================-->
            <section class="popular section" id="popular">
                <h2 class="section__title">
                    Choose Your Electric Car <br />
                    Of The Porsche Brand
                </h2>
                <c:if test="${list != null}">
                    <div class="popular__container container swiper">
                        <div class="swiper-wrapper">
                            <c:forEach var="car" items="${list}">
                                <c:if test="${car.description == 'popular'}">
                                    <article class="popular__card swiper-slide">
                                        <form action="DispatchServlet" method="POST">
                                            <div class="shape shape__smaller"></div>

                                            <input type="hidden" name="id" value="${car.carId}">
                                            <input type="hidden" name="page" value="index">

                                            <h1 class="popular__title">${car.carCatogory}</h1>
                                            <h3 class="popular__subtitle">${car.carName}</h3>

                                            <img src="${car.image}" alt="" class="popular__img" />

                                            <div class="popular__data">
                                                <div class="popular__data-group">
                                                    <i class="ri-funds-line"></i> ${car.carSpeed};
                                                </div>
                                                <div class="popular__data-group">
                                                    <i class="ri-charging-pile-2-line"></i> Electric
                                                </div>
                                            </div>

                                            <h3 class="popular__price">${car.carPrice}$</h3>

                                            <button class="button popular__button" onclick="showPopup()">
                                                <i class="ri-shopping-bag-2-line">
                                                    <input type="hidden" name="action" value="buy">
                                                </i>
                                            </button> 
                                        </form>
                                    </article>
                                </c:if>
                            </c:forEach>
                        </div>


                        <div class="swiper-pagination"></div>
                    </div>
                </c:if>
            </section>

            <!--==================== FEATURES ====================-->
            <section class="features section">
                <h2 class="section__title">
                    More Features
                </h2>

                <div class="features__container container grid">
                    <div class="features__group">
                        <img src="assets/img/features.png" alt="" class="features__img">

                        <div class="features__card features__card-1">
                            <h3 class="features__card-title">800V</h3>
                            <p class="features__card-description">Turbo <br> Chargin</p>
                        </div>

                        <div class="features__card features__card-2">
                            <h3 class="features__card-title">350</h3>
                            <p class="features__card-description">Km <br> Range</p>
                        </div>

                        <div class="features__card features__card-3">
                            <h3 class="features__card-title">480</h3>
                            <p class="features__card-description">Km <br> Travel</p>
                        </div>
                    </div>
                </div>

                <img src="assets/img/map.svg" alt="" class="features__map">
            </section>
            <!--==================== FEATURED ====================-->
            <section class="featured section" id="featured">
                <h2 class="section__title">
                    Featured Luxury Car
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
                                <c:if test="${car.description == 'item'}">
                                    <form action="DispatchServlet" method="POST">
                                        <article class="featured__card mix ${car.carCatogory}">
                                            <div class="shape shape__smaller"></div>

                                            <h1 class="featured__title">${car.carCatogory}</h1>

                                            <h3 class="featured__subtitle">${car.carName}</h3>

                                            <img src="${car.image}" alt="" class="featured__img">

                                            <h3 class="featured__price">${car.carPrice} $</h3>

                                            <input type="hidden" name="page" value="index">
                                            <input type="hidden" name="id" value="${car.carId}">

                                            <button class="button featured__button" onclick="showPopup()">
                                                <i class="ri-shopping-bag-2-line">
                                                    <input type="hidden" name="action" value="buy">
                                                </i>
                                            </button>
                                        </article>
                                    </form>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </section>

            <!--==================== OFFER ====================-->
            <section class="offer section">
                <img src="assets/img/offer-bg.png" alt="" class="offer__bg">
                <div class="offer__container container grid">
                    <div class="offer__data">
                        <h2 class="section__title offer__title">
                            Do You Want To Receive <br> Special Offers?
                        </h2>

                        <p class="offer__description">
                            Be the first to receive all the information about our 
                            products and new cars by email by subscribing to our 
                            mailing list.
                        </p>

                        <a href="#" class="button">
                            Subcribe Now
                        </a>
                    </div>

                    <img src="assets/img/offer.png" alt="" class="offer__img">
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

        <!--=============== MAIN JS ===============-->
        <script src="assets/js/searchbar.js"></script>
    </body>
</html>
