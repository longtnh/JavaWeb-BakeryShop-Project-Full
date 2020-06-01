

<%@page import="java.util.HashMap"%>
<%@page import="model.Order"%>
<%@page import="model.Order"%>
<%@page import="model.Feedback"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lighthouse Shop</title>
        <link rel="stylesheet" type="text/css" href="./style/project.css">
        <link rel="icon" href="./image/lighthouse.png" type="image/gif" sizes="16x16">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script type="text/javascript">
        </script>
        <style>
            #bill {
                display: block;
                color: white;
                text-align: center;
                padding: 6px 16px;
                text-decoration: none;
                font-size: 27px;
            }
        </style>
    </head>
    <body>
        <header id="header-background">

        </header>
        <div id="mySidenav" class="sidenav">
            <a href="https://www.facebook.com/dungculambanh.lighthouse/" id="facebook" target="_blank"><b>Facebook</b></a>
            <a href="https://www.instagram.com/dungculambanh.lightho/" id="instagram" target="_blank"><b>Instagram</b></a>
            <a href="https://shopee.vn/shop/33125773/search" id="shopee" target="_blank"><b>Shopee</b></a>
        </div>
        <nav>
            <ul>
                <li><a class="active" href="project.jsp"><b>Home</b></a></li>
                <li><a href="order.jsp"><b>Products</b></a></li>
                <li><a href="contact.jsp"><b>Contact</b></a></li>
                    <%
                        HttpSession s = request.getSession();
                        String cname = (String) s.getAttribute("cname");
                        String role = (String) s.getAttribute("role");
                        int thongbao = 0;
                        if (s.getAttribute("idu") != null) {
                            int ID = (Integer) s.getAttribute("idu");
                            HashMap<Integer, Order> danhsach = Order.checkOrder(ID);
                            pageContext.setAttribute("thongbao", danhsach.size());
                            thongbao = danhsach.size();
                            pageContext.setAttribute("danhsach", danhsach);
                        }
                        if (role != null && role.equals("0")) {
                    %>
                <div class="dropdown">
                    <label id="bill"><b>Admin</b></label>
                    <div class="dropdown-content">
                        <a href="customerManager.jsp" style="z-index: 4; font-size: 27px"><b>Customer</b></a>
                        <a href="feedbackManager.jsp" style="z-index: 4; font-size: 27px"><b>Feedback</b></a>
                        <a href="billManagerAdmin.jsp" style="z-index: 4; font-size: 27px"><b>Order</b></a>
                        <a href="income.jsp" style="z-index: 4; font-size: 27px"><b>Income</b></a>
                    </div>
                </div>
                <%
                    }
                    if (role != null && role.equals("1")) {
                %>
                <div class="dropdown">
                    <label id="bill"><b>Manager</b></label>
                    <div class="dropdown-content">
                        <a href="feedbackManager.jsp" style="z-index: 4; font-size: 27px"><b>Feedback</b></a>
                        <a href="BillManager.jsp" style="z-index: 4; font-size: 27px"><b>Order</b></a>
                    </div>
                </div>
                <%
                    }
                %>
                <div class="search-bar">
                    <form action="search" method="POST">
                        <%
                            if (role == null || (!role.equals("0") && !role.equals("1"))) {
                        %>
                        <a href="showCart.jsp" title="Cart">
                            <i class="fa fa-shopping-cart" style="font-size:27px;color:white"></i></a> &nbsp;
                            <%
                                }
                            %>
                        <div class="dropdown">
                            <label style="color: white; font-size : 27px" id="cname" name="cname">${cname}</label>
                            <div class="dropdown-content">
                                <a href="customer.jsp" style="z-index: 4; font-size: 20px">Profile</a>
                                <a href="urorder.jsp" style="z-index: 4; font-size: 20px">Your order</a>
                                <a href="cart?page=logout&action=order&id=0" style="z-index: 4; font-size: 20px">Log out</a>

                            </div>
                        </div>

                        <%

                            if (s.getAttribute ( 
                                "idu") != null) {
                                if (thongbao != 0) {
                        %>
                        <style>
                            #tb {
                                animation: shake 0.5s;
                                animation-iteration-count: infinite;
                            }
                        </style>
                        <%
                            }
                        %>
                        &nbsp;&nbsp;&nbsp;
                        <div class="dropdown">
                            <label style="color: white; font-size : 25px" id="noti-icon"><a href="" class="notification" style="color: white; font-family: Amatics SC; font-size: 22px"><b><i onclick="countdown();" class="fas fa-bell" id="tb"> <span class="badge">${pageScope.thongbao}</span></i></b></a></label>
                            <div class="dropdown-content" id="dropdown-noti">
                                <c:forEach items="${pageScope.danhsach}" var="danhsach">
                                    <a href="#" style="z-index: 4; width: 200px; font-size : 22px">Đơn hàng ${danhsach.key} đã được duyệt</a>
                                </c:forEach>
                            </div>
                        </div> &nbsp;  
                        <%
                            }
                        %>
                        <input type="text" name="search" placeholder="Search..." id="search" style="margin: 2px;padding: 2px; font-size: 22px;background-color: antiquewhite; border-radius: 5px;font-family: Amatic SC; "> &nbsp;
                        <input type="submit" value="Search" style="background-color: antiquewhite; border-radius: 5px; padding: 2px;font-size: 22px;font-family: Amatic SC;">
                    </form>
                </div>
            </ul>
        </nav>
        <section>
            <aside id="about">
                <h1 style="text-align: center; font-size: 50px;">Lighthouse Shop</h1>
                <img id="img" src="./image/lighthouse2.jpg" height="100px" width="100px">
                <p style="font-size: 32px; text-indent: 30px;" align="justify"><b>Lighthouse Bakery Shop is a distributor of professional bakery equipment. Coming to Lighthouse shop you do not need to care about price and quality of goods. Because we did it for you.</b></p>
                <br>
                <hr>
                <p style="font-size: 27px; text-align: center;"><b>Open : 8:00 - Close : 20:00<br>(Time to lunch : 12:00 -> 13:00)</b></p>
                <hr>
                <p style="font-size: 40px; text-align: center;"><b>Welcome to Lighthouse Shop</b></p>
            </aside>
            <article>
                <h1 style="text-align: center; font-size: 40px;">About Us</h1>
                <p style="font-size: 25px; text-indent: 40px" align="justify">We want to write more about the story at our store.</p>
                <p style="font-size: 25px; text-indent: 40px" align="justify">It is our desire to open a small space for all those who love to make cookies will be more convenient when coming to Lighthouse. All fresh bakery items and utensils will be available. More than that, personal tips, personal stories related to delicious food, stories around the kitchen and the story of life we ​​are not afraid to listen and share ...</p>
                <p style="font-size: 25px; text-indent: 40px" align="justify">We also want to bring a comfortable experience and absolute customer care for all customers as well as what they have learned, experience in many places, many plots that we have the opportunity to place Come on. It can be online shopping, delivery and fast, customer care 24/24, is paid online with many technologies, and a lot of other technological gadgets for kitchen lovers. I also race, catch up with the 4.0 trend of the whole society. The kitchen is also convenient and technology is not right ?</p>
                <img id="img" src="./image/lighthouse3.jpg" height="480px" width="720px" style="border-radius: 20px;">
                <p style="font-size: 25px; text-indent: 40px" align="justify">We also want the Lighthouse to have our own features, such as taking care of every single piece of green, each song, each video tutorial to make cake and every corner of our house will be perfect day by day, Upgraded by all love and by our hands.</p>
                <p style="font-size: 25px; text-indent: 40px" align="justify">And a small message Lighthouse wants to send to you - the guests that we are anxious to meet that "shopping, preparing the loaf, delicious food will be easier and happier than ever to arrive. with us! "</p>
            </article>
        </section>

        <div style="background-color: #8A4B08; color: white; padding: 10px;" id="blogs">
            <h1 style="text-align: center; font-size: 50px;">Blogs</h1>
            <p style="font-size: 40px; text-align: center;"><b>Share some tips, experiences, recipe.</b></p>
            <div class="div2">
                <div class="div3">
                    <center>
                        <a href="milktea.jsp" target="_blank">
                            <img src="./image/milktea.jpg" height="360" width="600" style="border-radius: 20px;"><br></a>
                        <a href="milktea.jsp" target="_blank" style="font-size: 35px; color: white; text-decoration: none;"><b>How to make Bubble Milk Tea</b></a>
                        <br>
                        <br>
                        <a href="cupcake.jsp" target="_blank">
                            <img src="./image/cupcake6.jpg" height="360" width="600" style="border-radius: 20px;"><br></a>
                        <a href="cupcake.jsp" target="_blank" style="font-size: 35px; color: white; text-decoration: none;"><b>How to make Cupcake</b></a>
                    </center>
                </div>
                <div class="div4">
                    <center>
                        <a href="pizza.jsp" target="_blank">
                            <img src="./image/pizza4.jpg" height="360" width="600" style="border-radius: 20px;"><br></a>
                        <a href="pizza.jsp" target="_blank" style="font-size: 35px; color: white; text-decoration: none;"><b>How to make Pizza</b></a>
                        <br>
                        <br>
                        <a href="donut.jsp" target="_blank">
                            <img src="./image/donut4.jpg" height="360" width="600" style="border-radius: 20px;"><br></a>
                        <a href="donut.jsp" target="_blank" style="font-size: 35px; color: white; text-decoration: none;"><b>How to make Donut</b></a>
                    </center>
                </div>
            </div>
            <br>
        </div>

        <div style="background-color: #F8F2C9; color: black; padding: 10px;" id="blogs">
            <%
                Feedback f = new Feedback();
                ArrayList<Feedback> feedback = f.getFeedCheck();
                if (feedback != null) {
                    for (Feedback x : feedback) {
                        int star = Integer.parseInt(x.getStar());
            %>
            <div class="mySlides" style="font-size: 35px">
                <label><b>First name :</b>   <%=x.getFirstName()%> <%=x.getLastName()%></label><br>
                <!--    <label><b>Last name :</b>    </label><br>-->
                <label><b>Email :</b>        <%=x.getEmail()%></label><br>
                <label><b>Star :</b>  </label>
                <%
                    for (int i = 0; i < star; i++) {
                %>
                <span class="fa fa-star checked" style="size: 1px"></span>
                <%
                    }
                %>

                <br>
                <label><b>Feedback :</b> </label>
                <p style="border-style: groove; width: 100%; height: 200px">  &nbsp;&nbsp; <%=x.getFeedback()%></p>
            </div>
            <%
                    }
                }
            %>
        </div>

        <script>
            var slideIndex = 0;
            carousel();

            function carousel() {
                var i;
                var x = document.getElementsByClassName("mySlides");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > x.length) {
                    slideIndex = 1
                }
                x[slideIndex - 1].style.display = "block";
                setTimeout(carousel, 5000);
            }
        </script>

        <footer id="contact">
            <h1 style="text-align: center; font-size: 50px;">Contact</h1>
            <center>
                <p style="font-size: 35px;"><i class="material-icons" style="font-size: 30px">location_on</i><b> Address : 53 Hai Ho, Da Nang</b></p>
                <img src="./image/Untitled.png" height="300px">
                <p style="font-size: 35px;"><i class="fa fa-phone" style="font-size:30px"></i><b> 0947241092 (Mr. Hai Dang )</b></p>
                <p style="font-size: 35px;"><i class='fas fa-envelope' style='font-size:30px'></i><b> dungculambanh.lighthouse@gmail.com</b></p>
                <!-- <p style="font-size: 40px;"><b>Send us your information if you need to advice !! We will contact with you.</b></p>
                <form onsubmit="main()">
                        <input type="text" name="customer" placeholder="Your Name"><br><br>
                        <input type="text" name="phone" placeholder="Phone Number"><br><br>
                        <input type="text" name="mail" placeholder="Email"><br><br>
                        <input type="submit" value="Send" style="width: 40%">
                </form> -->
                <br>
                <a href="https://www.facebook.com/dungculambanh.lighthouse/" target="_blank" title="Visit Facebook" style="text-decoration: none">
                    <i class='fab fa-facebook' style="font-size: 45px; color: white"></i>
                </a>
                &nbsp;&nbsp;
                <a href="https://www.instagram.com/dungculambanh.lightho/" target="_blank" title="Visit Instagram" style="text-decoration:  none">
                    <i class='fab fa-instagram' style="font-size: 45px; color: white"></i>
                </a>
                &nbsp;&nbsp;
                <a href="https://shopee.vn/ngonhaidang2410" target="_blank" title="Visit Shopee">
                    <img src="https://static.wixstatic.com/media/b33900_cb1d06092d574909a1ab7a50997c8ff5~mv2.png" height="45px" width="45px" alt="Shopee">
                </a>
            </center>
        </footer>
        <div style="background-color: black; color: white; padding: 10px;">
            <p style="text-align: center;font-size: 35px;"><b>Design By RucRoTeam</b></p>
        </div>
    </body>
</html>
