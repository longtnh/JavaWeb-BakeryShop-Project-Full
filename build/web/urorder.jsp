

<%@page import="java.util.HashMap"%>
<%@page import="model.Product"%>
<%@page import="model.Pro_Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer</title>
        <link rel="stylesheet" type="text/css" href="./style/project.css">
        <link rel="icon" href="./image/lighthouse.png" type="image/gif" sizes="16x16">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
                border:  0px;
                font-size: 24px;
            }

            th, td {
                padding: 8px;
                text-align: center;
                border-bottom: 2px solid black;
                border-right: 2px solid black;
                font-weight: bold;
            }

            tr:hover {background-color:#cf821f;}

            #submit1 {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100px;
            }
            #submit1 {
                background-color: #444;
            }
            #submit1:hover {
                background-color: #5F9EA0;
            }
            #bill {
                display: block;
                color: white;
                text-align: center;
                padding: 6px 16px;
                text-decoration: none;
                font-size: 27px;
            }

            .tablink {
                background-color: #555;
                color: white;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                font-size: 17px;
                width: 25%;
            }

            .tablink:hover {
                background-color: #777;
            }

            /* Style the tab content */
            .tabcontent {
                color: black;
                display: none;
                padding: 50px;
            }

            #London {background-color:white ;}
            #Paris {background-color:white;}
            #Tokyo {background-color:white;}
            #Oslo {background-color:white;}
        </style>
        <script type="text/javascript">
        </script>
    </head>
</head>
<body>
    <header id="header-background">

    </header>

    <nav>
        <ul>
            <li><a class="active" href="project.jsp"><b>Home</b></a></li>
            <li><a href="order.jsp"><b>Products</b></a></li>
            <li><a href="contact.jsp"><b>Contact</b></a></li>
                <%
                    HttpSession s = request.getSession();
                    String cname = (String) s.getAttribute("cname");
                    String role = (String) s.getAttribute("role");
                    int c_id = Integer.parseInt(s.getAttribute("idu").toString());
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
                        if (s.getAttribute(
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
                        <label style="color: white; font-size : 25px" id="noti-icon"><a href="seen?id=${sessionScope.idu}" class="notification" style="color: white; font-family: Amatics SC; font-size: 22px"><b><i onclick="countdown();" class="fas fa-bell" id="tb"> <span class="badge">${pageScope.thongbao}</span></i></b></a></label>
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

    <div style="background-color: #D9A056;">
        <br>
        <p style="font-size: 55px; text-align: center;"><b>Trading your Order</b></p>
        <br>
        <%
            Order or = new Order();
            ArrayList<Order> al1 = or.getUrOrder(c_id, 0);
            ArrayList<Order> al2 = or.getUrOrder(c_id, 1);
            ArrayList<Order> al3 = or.getUrOrder(c_id, 2);
            ArrayList<Order> al4 = or.getUrOrder(c_id, 3);
        %>
        <button class="tablink" onclick="openCity('London', this, '#71afc7')" id="defaultOpen">Đơn đã đặt (<%=al1.size()%>)</button>
        <button class="tablink" onclick="openCity('Paris', this, '#71afc7')">Đang chuẩn bị đơn hàng (<%=al2.size()%>)</button>
        <button class="tablink" onclick="openCity('Tokyo', this, '#71afc7')">Đang giao hàng (<%=al3.size()%>)</button>
        <button class="tablink" onclick="openCity('Oslo', this, '#71afc7')">Đã hoàn thành (<%=al4.size()%>)</button>
        <div id="London" class="tabcontent">
            <h1 style="text-align: center;">Đơn đã đặt</h1>
            <%
                for (Order x : al1) {
                    Pro_Order pro = new Pro_Order();
                    ArrayList<Pro_Order> p = pro.getOr(x.getOr_id());
            %>

            <label style="text-align: left; font-size: 24px"><b>Address :</b> <%=x.getAddress()%></label><br>
            <label style="text-align: left; font-size: 24px"><b>Phone :</b> <%=x.getPhone()%></label><br>
            <label style="text-align: left; font-size: 24px"><b>Day :</b> <%=x.getDay()%></label><br><br>
            <table>
                <col width="10%">
                <col width="20%">
                <col width="30%">
                <col width="10%">
                <col width="15%">
                <col width="15%">
                <tr>
                    <th>STT</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                </tr>
                <%
                    int stt = 0;
                    int totalp = 0;
                    for (Pro_Order k : p) {
                        Product product = new Product();
                        product.getPro(String.valueOf(k.getP_id()));
                        stt++;
                %>
                <tr>
                    <td><%=stt%></td>
                    <td><img src="<%=product.getImage()%>" height="100" width="100"></td>
                    <td><%=product.getPname()%></td>
                    <td><%=product.getPrice()%>,000 VND</td>
                    <td><%=k.getQuantity()%></td>
                    <td><%=k.getQuantity() * product.getPrice()%>,000 VND</td>
                </tr>
                <%
                        totalp += k.getQuantity() * product.getPrice();
                    }
                %>
            </table>
            <table>
                <col width="85.05%">
                <col widtth="14.95%">
                <tr>
                    <th style="text-align: right">Total : </th>
                    <th style="text-align: center"><%=totalp%>,000 VND</th>
                </tr>
            </table>
            <br><br>
            <%
                }
            %>
        </div>

        <div id="Paris" class="tabcontent">
            <h1 style="text-align: center;">Đang chuẩn bị đơn hàng</h1>
            <%
                for (Order x : al2) {
                    Pro_Order pro = new Pro_Order();
                    ArrayList<Pro_Order> p = pro.getOr(x.getOr_id());
            %>

            <label style="text-align: left; font-size: 24px"><b>Address :</b> <%=x.getAddress()%></label><br>
            <label style="text-align: left; font-size: 24px"><b>Phone :</b> <%=x.getPhone()%></label><br>
            <label style="text-align: left; font-size: 24px"><b>Day :</b> <%=x.getDay()%></label><br><br>
            <table>
                <col width="10%">
                <col width="20%">
                <col width="30%">
                <col width="10%">
                <col width="15%">
                <col width="15%">
                <tr>
                    <th>STT</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                </tr>
                <%
                    int stt = 0;
                    int totalp = 0;
                    for (Pro_Order k : p) {
                        Product product = new Product();
                        product.getPro(String.valueOf(k.getP_id()));
                        stt++;
                %>
                <tr>
                    <td><%=stt%></td>
                    <td><img src="<%=product.getImage()%>" height="100" width="100"></td>
                    <td><%=product.getPname()%></td>
                    <td><%=product.getPrice()%>,000 VND</td>
                    <td><%=k.getQuantity()%></td>
                    <td><%=k.getQuantity() * product.getPrice()%>,000 VND</td>
                </tr>
                <%
                        totalp += k.getQuantity() * product.getPrice();
                    }
                %>
            </table>
            <table>
                <col width="85.05%">
                <col widtth="14.95%">
                <tr>
                    <th style="text-align: right">Total : </th>
                    <th style="text-align: center"><%=totalp%>,000 VND</th>
                </tr>
            </table>
            <%
                }
            %>

        </div>

        <div id="Tokyo" class="tabcontent">
            <h1 style="text-align: center;">Đang giao hàng</h1>
            <%
                for (Order x : al3) {
                    Pro_Order pro = new Pro_Order();
                    ArrayList<Pro_Order> p = pro.getOr(x.getOr_id());
            %>

            <label style="text-align: left; font-size: 24px"><b>Address :</b> <%=x.getAddress()%></label><br>
            <label style="text-align: left; font-size: 24px"><b>Phone :</b> <%=x.getPhone()%></label><br>
            <label style="text-align: left; font-size: 24px"><b>Day :</b> <%=x.getDay()%></label><br><br>
            <table>
                <col width="10%">
                <col width="20%">
                <col width="30%">
                <col width="10%">
                <col width="15%">
                <col width="15%">
                <tr>
                    <th>STT</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                </tr>
                <%
                    int stt = 0;
                    int totalp = 0;
                    for (Pro_Order k : p) {
                        Product product = new Product();
                        product.getPro(String.valueOf(k.getP_id()));
                        stt++;
                %>
                <tr>
                    <td><%=stt%></td>
                    <td><img src="<%=product.getImage()%>" height="100" width="100"></td>
                    <td><%=product.getPname()%></td>
                    <td><%=product.getPrice()%>,000 VND</td>
                    <td><%=k.getQuantity()%></td>
                    <td><%=k.getQuantity() * product.getPrice()%>,000 VND</td>
                </tr>
                <%
                        totalp += k.getQuantity() * product.getPrice();
                    }
                %>
            </table>
            <table>
                <col width="85.05%">
                <col widtth="14.95%">
                <tr>
                    <th style="text-align: right">Total : </th>
                    <th style="text-align: center"><%=totalp%>,000 VND</th>
                </tr>
            </table>
            <%
                }
            %>
        </div>

        <div id="Oslo" class="tabcontent">
            <h1 style="text-align: center;">Đã hoàn thành</h1>
            <%
                    for (Order x : al4) {
                    Pro_Order pro = new Pro_Order();
                    ArrayList<Pro_Order> p = pro.getOr(x.getOr_id());
            %>

            <label style="text-align: left; font-size: 24px"><b>Address :</b> <%=x.getAddress()%></label><br>
            <label style="text-align: left; font-size: 24px"><b>Phone :</b> <%=x.getPhone()%></label><br>
            <label style="text-align: left; font-size: 24px"><b>Day :</b> <%=x.getDay()%></label><br><br>
            <table>
                <col width="10%">
                <col width="20%">
                <col width="30%">
                <col width="10%">
                <col width="15%">
                <col width="15%">
                <tr>
                    <th>STT</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                </tr>
                <%
                    int stt = 0;
                    int totalp = 0;
                    for (Pro_Order k : p) {
                        Product product = new Product();
                        product.getPro(String.valueOf(k.getP_id()));
                        stt++;
                %>
                <tr>
                    <td><%=stt%></td>
                    <td><img src="<%=product.getImage()%>" height="100" width="100"></td>
                    <td><%=product.getPname()%></td>
                    <td><%=product.getPrice()%>,000 VND</td>
                    <td><%=k.getQuantity()%></td>
                    <td><%=k.getQuantity() * product.getPrice()%>,000 VND</td>
                </tr>
                <%
                        totalp += k.getQuantity() * product.getPrice();
                    }
                %>
            </table>
            <table>
                <col width="85.05%">
                <col widtth="14.95%">
                <tr>
                    <th style="text-align: right">Total : </th>
                    <th style="text-align: center"><%=totalp%>,000 VND</th>
                </tr>
            </table>
            <%
                }
            %>
        </div>
    </div>


    <script>
        function openCity(cityName, elmnt, color) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablink");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].style.backgroundColor = "";
            }
            document.getElementById(cityName).style.display = "block";
            elmnt.style.backgroundColor = color;

        }
        // Get the element with id="defaultOpen" and click on it
        document.getElementById("defaultOpen").click();
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
