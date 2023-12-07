<%-- 
    Document   : Login
    Created on : Aug 19, 2023, 6:46:09 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <c:set var="msg" value="${requestScope.msg}"/>
        <c:set var="user" value="${sessionScope.currentUser}"/>
        <!--==================== HEADER ====================-->
        <header class="header" id="header">
            <nav class="nav container">
                <a href="index.jsp" class="nav__logo">
                    <i class="ri-steering-line"></i>
                    Carz
                </a>

                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item">
                            <a href="index.jsp" class="nav__link active-link"> Home </a>
                        </li>
                        <li class="nav__item">
                            <a href="index.jsp" class="nav__link"> About </a>
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
                        <li class="nav__item">
                            <a href="login.jsp" class="nav__link">Login</a>
                        </li>
                    </ul>

                    <div class="nav__close" id="nav-close">
                        <i class="ri-close-line"></i>
                    </div>
                </div>

                <!--Toggle button-->
                <div class="nav__close" id="nav-close">
                    <i class="ri-close-line"></i>
                </div>
            </nav>
        </header>

        <!--==================== MAIN ====================-->
        <main class="main main__login">
            <div class="background__login">
            <img class="background__login-bg" src="assets/img/offer-bg.png">
            <img class="background__login-car" src="assets/img/offer.png">
            </div>
            <!--==================== LOGIN ====================-->
            <section class="login__container container gird">
                <div class="login__form">
                    <c:if test="${user == null}">           
                        <c:if test="${msg != null}">
                            <h2 class="login__subtitle">${msg}</h2>         
                        </c:if>
                        <br>
                        <div class="login__form-value">
                            <form action="DispatchServlet" method="POST">
                                <input type="text" id="username" class="login__field-input" placeholder="Enter Username" name="userid">
                                <br><br>
                                <input type="password" id="pass" class="login__field-input" placeholder="Enter Password" name="password">
                                <br><br>
                                <button class="button login__button">
                                    <input type="hidden" name="action" value="loginvalidate"/>
                                    Login
                                </button>
                            </form>
                            <br>
                            <p>If you don't have account <br> please <a href="DispatchServlet?action=register">register</a></p>
                        </div>
                    </c:if>
                </div>
            </section>
        </main>




        <!--========== SCROLL UP ==========-->
        <a href="#" class="scrollup" id="scroll-up">
            <i class="ri-arrow-up-line"></i>
        </a>
        <!--=============== SCROLL REVEAL ===============-->
        <script src="assets/js/scrollreveal.min.js"></script>

        <!--=============== SWIPER JS ===============-->
        <script src="assets/js/swiper-bundle.min.js"></script>

        <!--=============== MAIN JS ===============-->
        <script src="assets/js/login.js"></script>
    </body>

</html>
