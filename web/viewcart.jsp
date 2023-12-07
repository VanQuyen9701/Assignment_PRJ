<%-- 
    Document   : viewcart
    Created on : Aug 24, 2023, 11:13:25 AM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <c:set var="cart" value="${sessionScope.cart}"/>
        <c:set var="no" value="${0}"/>
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
        </header>

        <!--==================== MAIN ====================-->
        <main class="main">
            <section class ="view__cart">
                <c:if test="${cart != null}">
                    <table class="table__view">
                        <c:forEach var="c" items="${cart.keySet()}">
                            <c:set var="quantity" value="${cart.get(c)}"/>
                            <c:set var="sum" value="${sum+quantity*c.carPrice}"/>
                            <form action="DispatchServlet" method="post">
                                <input type="hidden" value="update" name="action"/>
                                <input type="hidden" value="${c.carId}" name="carid"/> 
                                <tr>
                                    <td>${no + 1}</td>
                                    <td>
                                        <img src="${c.image}" class="cart__item-img">
                                    </td>
                                    <td>${c.carName}</td>
                                    <td>${c.carCatogory}</td>
                                    <td>${c.carPrice}</td>
                                    <td><input type="number" min="1" value="${cart.get(c)}" name="quantity"</td>
                                    <td>${quantity*c.carPrice}</td>
                                    <td>
                                        <button class="button" name="btn" value="remove">
                                            <i class="ri-delete-bin-line">   
                                            </i>
                                        </button>
                                        <button class="button" name="btn" value="update">
                                            <i class="ri-refresh-line">      
                                            </i>
                                        </button>
                                    </td>
                                </tr>
                                <c:set var="no" value="${no+1}"/>
                            </form>
                        </c:forEach>
                    </table>
                    <form action="DispatchServlet" method="POST">
                        <input type="hidden" name="action" value="check"/>
                        <button class="button">
                            <i class="ri-shopping-bag-3-line"></i>
                        </button>
                    </form>
                </c:if>
                <c:if test="${cart == null}">
                    <h1>You still not buy anything yet</h1>
                </c:if>
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
