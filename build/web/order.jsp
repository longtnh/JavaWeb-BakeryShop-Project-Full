

<%@page import="model.Order"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Search"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
                if (${cname}.equals(""))
                    alert("Please Sign Up or Login to continue your order");
            }
            window.fbAsyncInit = function () {
                FB.init({
                    appId: '{your-app-id}',
                    cookie: true,
                    xfbml: true,
                    version: 'v4.0'
                });

                FB.AppEvents.logPageView();

            };

            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {
                    return;
                }
                js = d.createElement(s);
                js.id = id;
                js.src = "https://connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));

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

                            if (s.getAttribute ("idu") != null) {
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
        <script>
            function countdown() {

            }

        </script>                        

        <div>
            <div style="background-color: #FCF9E6;">
                <hr style="width: 35%; text-align : center; color:black;">
                <hr style="width: 30%; text-align : center; color:black;">
                <h1 id="menu1">Menu</h1>
                <hr style="width: 30%; text-align : center; color:black;">
                <hr style="width: 35%; text-align : center; color:black;"><br><br>
                <center>
                    <form method="POST" action="cart">
                        <label for="menu-toggle" id="menu2">Cookie</label><br><br>
                        <div class="list">
                            <%
                                Product p = new Product();
                                ArrayList<Product> al = p.getType("Cookie");
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
                            <%  }
                                if (cname != null && cname.equals ("Admin")) {
                            %>
                            <div class="micay">
                                <a href="add_Pro.jsp"><image src="./image/plus_icon.png" width="160px" height="160px"/></a>
                            </div>

                            <%
                                }
                            %> 

                        </div><br><br><br>

                        <label for="menu-toggle" id="menu2">Cake</label><br><br>
                        <div class="list">
                            <%
                                al  = p.getType("Cake");
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
                            <%  }
                                if (cname != null && cname.equals ("Admin")) {
                            %>
                            <div class="micay">
                                <a href="add_Pro.jsp"><image src="./image/plus_icon.png" width="160px" height="160px"/></a>
                            </div>

                            <%
                                }
                            %> 
                        </div><br><br><br>

                        <label for="menu-toggle" id="menu2">Drink</label><br><br>
                        <div class="list">
                            <%
                                al  = p.getType("Drink");
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
                            <%  }
                                if (cname != null && cname.equals ("Admin")) {
                            %>
                            <div class="micay">
                                <a href="add_Pro.jsp"><image src="./image/plus_icon.png" width="160px" height="160px"/></a>
                            </div>

                            <%
                                }
                            %> 
                        </div><br><br><br>
                    </form>
                    <button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;" id="loginbt">Login</button>
                    <div id="id01" class="modal1">
                        <form action="login" method="POST" class="modal1-content animate" name="form1" onSubmit="return done1()">
                            <div class="imgcontainer">
                                <span onclick="document.getElementById('id01').style.display = 'none'" class="close1" title="Close Modal">&times;</span>
                                <!--      			<img src="avt.png" alt="Avatar" class="avatar">-->
                            </div>
                            <h1 style="font-size: 54px;">Login</h1><hr>
                            <div class="container">
                                <%
                                    Cookie[] co = request.getCookies();
                                    for (int i = 0;i< co.length ;i++) {
                                        Cookie c = co[i];
                                        if (c.getName().equals("us")) {
                                            request.setAttribute("us", c.getValue());
                                        }
                                        if (c.getName().equals("pa")) {
                                            request.setAttribute("pa", c.getValue());
                                        }
                                    }
                                %>

                                <label for="uname" style="font-size: 30px;"><b>Username</b></label>
                                <input type="text" placeholder="Enter Username" name="uname" required id="uname" value="${us}">

                                <label for="psw" style="font-size: 30px;"><b>Password</b></label>
                                <input type="password" placeholder="Enter Password" name="psw" required id="psw" value=${pa}>

                                <label style="font-size: 24px;">
                                    <input type="checkbox" checked="checked" name="remember"> Remember me
                                </label>
                            </div>

                            <div class="container" style="background-color:#f1f1f1">

                                <button type="button" onclick="document.getElementById('id01').style.display = 'none'" class="cancelbtn1">Cancel</button>
                                <button type="submit" id="btn2" onclick="done1()">Login</button>
                            </div>
                        </form>
                    </div>

                    <button onclick="document.getElementById('id101').style.display = 'block'" style="width:auto;" id = "signupbt2">Sign Up</button>

                    <div id="id101" class="modal2">
                        <form action="csignup" method="POST" class="modal1-content animate" onSubmit="return done2()" name="form2" id="form2">
                            <div class="imgcontainer">
                                <span onclick="document.getElementById('id101').style.display = 'none'" class="close1" title="Close Modal">&times;</span>
                                <h1 style="font-size: 42px;">Sign Up</h1>
                                <p style="font-size: 32px;">Please fill in this form to create an account.</p>
                                <hr>
                                <input type="text" placeholder="FullName" name="name" required id="uname" style="font-size: 30px; font-family: Amatic SC;">
                                <!--      			<label for="email" style="font-size: 30px;"><strong>Username</strong></label>-->
                                <input type="text" placeholder="Username" name="user" required id="uname" style="font-size: 30px; font-family: Amatic SC;">
                                <!--      			<label for="psw" style="font-size: 30px;"><b>Password</b></label>-->
                                <input type="password" placeholder="Enter Password" name="psws" required id="psws" style="font-size: 30px; font-family: Amatic SC;">
                                <!--      			<label for="psw-repeat" style="font-size: 30px;"><b>Repeat Password</b></label>-->
                                <input type="password" placeholder="Repeat Password" name="psw-repeat" required id="psw-repeat" style="font-size: 30px; font-family: Amatic SC;">
                                <!--				<label style="font-size: 30px;"><b>Email</b></label>-->
                                <input type="text" placeholder="Email" name="email" required id="email" style="font-size: 30px; font-family: Amatic SC;">
                                <input type="text" placeholder="Address" name="address" required id="address" style="font-size: 30px; font-family: Amatic SC">

                                </label>
                                <br>
                                <label style="font-size: 35px"><b>Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
                                    <input type="radio" name="gender" value="male" style="margin-bottom: 15px;"><b>Male</b>
                                    <input type="radio" value="female" name="gender" style="margin-bottom: 15px;"><b>Female</b>
                                </label>
                                <br>
                                <label style="font-size: 35px;"><b>Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
                                    <select style="height: 38px; width: 100px; font-family: Amatic SC; font-size: 30px;" name="birth">
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                        <option value="26">26</option>
                                        <option value="27">27</option>
                                    </select>
                                </label>
                                <input type="text" placeholder="PhoneNumber" name="phone" required id="phone" style="font-size: 30px; font-family: Amatic SC;">

                                <!--				<p style="font-size: 30px">By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>-->
                                <div class="clearfix">
                                    <button type="button" onclick="document.getElementById('id01').style.display = 'none'" class="cancelbtn">Cancel</button>
                                    <button type="submit" class="signupbtn">Sign Up</button>
                                </div>
                            </div>
                        </form>
                    </div>


                    <script>
                        // Get the modal

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

                        var js_email = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;


                        function done2(form) {
                            if (!js_email.test(email.value) || email.value == "") {
                                alert("Your Email is not valid");
                                return false;
                            }
                            else if (document.getElementById('psws').value == null || document.getElementById('psws').value == "" ||
                                    document.getElementById('psws').value.length < 8) {
                                alert("Please enter Password");
                                return false;
                            }
                            else if (document.getElementById('psw-repeat').value == null || document.getElementById('psw-repeat').value == "" ||
                                    document.getElementById('psw-repeat').value != document.getElementById('psws').value) {
                                alert("Please confirm your password");
                                return false;
                            }
                            else if (document.getElementById('phone').value.length != 10 ||
                                    !document.getElementById('phone').value.match("^0[0-9]")) {
                                alert("Your phone number is not correct");
                                return false;
                            }
                            else if (document.getElementById('address').value == "" || document.getElementById('address').value == null) {
                                alert("Your address is not correct");
                                return false;
                            }
                            else
                                return true;
                        }

                        function done1(form) {
                            var user = document.getElementById('uname').value;
                            var ps = document.getElementById('psw').value;
                            if (user == null || user == "") {
                                alert("Please enter your Username");
                            }
                            else if (ps == null || ps == "") {
                                alert("Please enter your Password");
                            }
                            return true;
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
