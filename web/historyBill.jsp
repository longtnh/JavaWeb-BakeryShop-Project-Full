

<%@page import="model.Product"%>
<%@page import="model.Pro_Order"%>
<%@page import="model.Order"%>
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
        <style>
            label {
                font-weight: bold;
                font-size: 31px;
                padding-left: 10px;
            }
            table {
                border-collapse: collapse;
                width: 100%;
                border:  0px;
                font-size: 30px;
            }

            th, td {
                padding: 8px;
                text-align: center;
                border-bottom: 2px solid black;
                border-right: 2px solid black;
                font-weight: bold;
            }
            .collapsible:hover {
                background-color: white;
            }
            .content {
                display: none;
                overflow: hidden;
            }
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

        <div style="background-color: #D9A056">
            <br><br><br>
            <h1 style="text-align: center; font-size: 50px;">History Order</h1>


            <%
                ArrayList<Order> or = null;
                Order o = new Order();
//                  log("MES"+String.valueOf(Integer.parseInt()==1));
                or = o.getOrId(c_id);
                for (Order x : or) {
                    x.getPay(x.getOr_id());
                    ArrayList<Pro_Order> pro = new ArrayList<Pro_Order>();
                    Pro_Order pr = new Pro_Order();
                    pro = pr.getOr(x.getOr_id());
            %>  
            <button class="collapsible" style="cursor: pointer;width: 100%; height: 50px; background-color: #585858; border : none; font-family: Amatic SC; font-size: 30px; color: white"><%=x.getDay()%></button>
            <div class="content"><br>
                <label style="text-align: left"><b>Name :</b> <%=cname%></label><br>
                <label style="text-align: left"><b>Address :</b> <%=x.getAddress()%></label><br><br>
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
                        for (Pro_Order m : pro) {
                            Product product = new Product();
                            product.getPro(String.valueOf(m.getP_id()));
                            stt++;
                    %>
                    <tr>
                        <td><%=stt%></td>
                        <td><img src="<%=product.getImage()%>" height="100" width="100"></td>
                        <td><%=product.getPname()%></td>
                        <td><%=product.getPrice()%>,000 VND</td>
                        <td><%=m.getQuantity()%></td>
                        <td><%=m.getQuantity() * product.getPrice()%>,000 VND</td>
                    </tr>
                    <%
                            totalp += m.getQuantity() * product.getPrice();
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
            </div>

            <%

                }
            %>                                    
            <br><br><br><br>
        </div>
        <script>
            var coll = document.getElementsByClassName("collapsible");
            var i;

            for (i = 0; i < coll.length; i++) {
                coll[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var content = this.nextElementSibling;
                    if (content.style.display === "block") {
                        content.style.display = "none";
                    } else {
                        content.style.display = "block";
                    }
                });
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
