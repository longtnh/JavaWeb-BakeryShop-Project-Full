
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Search"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lighthouse Shop</title>
        <link rel="stylesheet" type="text/css" href="./style/order.css">
        <link rel="icon" href="./image/lighthouse.png" type="image/gif" sizes="16x16">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script type="text/javascript">
            function ord() {
                alert("Please Sign Up or Login to continue your order");
            }
        </script>
        <style type="text/css">
        </style>
    </head>
    <body>
        <header id="header-background">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                            if (role == null || !role.equals("0") || !role.equals("1")) {
                        %>
                        <a href="showCart.jsp" title="Cart">
                            <i class="fa fa-shopping-cart" style="font-size:27px;color:white"></i></a> &nbsp;
                            <%
                                }
                            %>

                        <div class="dropdown">
                            <label style="color: white; font-size : 27px" name="cname">${cname}</label>
                            <div class="dropdown-content">
                                <a href="customer.jsp" style="z-index: 4; font-size: 20px">Profile</a>
                                <a href="urorder.jsp" style="z-index: 4; font-size: 20px">Your order</a>
                                <a href="cart?page=logout&action=order&id=0" style="z-index: 4; font-size: 20px">Log out</a>

                            </div>
                        </div>
                        <input type="text" name="search" placeholder="Search..." id="search" style="margin: 2px;padding: 2px; font-size: 22px;background-color: antiquewhite; border-radius: 5px;font-family: Amatic SC; "> &nbsp;
                        <input type="submit" value="Search" style="background-color: antiquewhite; border-radius: 5px; padding: 2px;font-size: 22px;font-family: Amatic SC;">
                    </form>
                </div>
            </ul>
        </nav>
        <div>
            <div style="background-color: #F5F5DC;">
                <hr style="width: 35%; text-align : center; color:black;">
                <hr style="width: 30%; text-align : center; color:black;">
                <h1 id="menu1">Menu</h1>
                <hr style="width: 30%; text-align : center; color:black;">
                <hr style="width: 35%; text-align : center; color:black;"><br><br>
                <center>
                    <label for="menu-toggle" id="menu2">Search</label><br><br>
                    <%
                        ArrayList<Product> al = (ArrayList<Product>) request.getAttribute("searchpro");
                        if (al.size() != 0) {
                    %>
                    <div class="list">
                        <%
                            for (Product x : al) {
                        %>
                        <div class="micay">
                            <div class="micay">
                                <%
                                    if (cname != null && cname.equals("Admin")) {
                                %>
                                <a href="edit_Pro.jsp?id=<%=x.getP_id()%>"><img src="<%=x.getImage()%>" width="160px" height="160px"></a> 
                                    <%
                                    } else {
                                    %>
                                <a href="detail_Pro.jsp?id=<%=x.getP_id()%>"><img src="<%=x.getImage()%>" width="160px" height="160px"></a>
                                    <% }
                                    %>
                                <div class="middle">
                                    <%
                                        if (x.getStock() > 0) {
                                    %>
                                    <a style="text-decoration: none;" href="cart?page=addtocart&action=order&id=<%=x.getP_id()%>"><div class="text"><%=x.getPrice()%>,000 VND</div></a>
                                    <%
                                    } else {
                                    %>                         
                                    <a onclick="return check1()" style="text-decoration: none;" ><div class="text">Hết hàng</div></a>
                                    <%
                                        }
                                    %>                              
                                </div>
                                <p id="name"><%=x.getPname()%></p>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </center>    
                <%
                } else {
                %>
                <center>
                    <p style="font-size: 35px;text-align: center"><i class="fa fa-close" style="font-size:35px;"></i><b> No product is found</b></p><br>

                </center>
                <%
                    }
                %>
                <br><br></div>      
            <script>
                var modal1 = document.getElementById('id01');

                window.onload = function () {
                    if (document.getElementById("cname").textContent.length > 0) {
                        document.getElementById("loginbt").hidden = "true";
                        document.getElementById("signupbt2").hidden = "true";
                    }
                }
                // When the user clicks anywhere outside of the modal, close it
                window.onclick = function (event) {
                    if (event.target == modal1) {
                        modal1.style.display = "none";
                    }
                }

                var modal2 = document.getElementById('id101');

                // When the user clicks anywhere outside of the modal, close it
                window.onclick = function (event) {
                    if (event.target == modal2) {
                        modal2.style.display = "none";
                    }
                }

                function check1() {
                    alert("We are sorry about that the product is out of stock. Please choose another products. Thank you !");
                    return false;
                }
            </script>
        </div>


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
