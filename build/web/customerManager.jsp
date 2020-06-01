
<%@page import="model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
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
                font-size: 30px;
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
        </style>
        <script type="text/javascript">
        </script>
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

        <div style="background-color: #D9A056;">
            <br>
            <p style="font-size: 55px; text-align: center;margin-bottom: 10px;"><b>Customer List</b></p> 
            <center>
                <div class="search-bar">
                    <form action="searchCus" method="POST">
                        <input type="text" name="search" placeholder="  Search Customer..." id="search" style="margin: 2px;padding: 2px; font-size: 27px;background-color: antiquewhite; border-radius: 5px;font-family: Amatic SC; width: 500px; ">
                        <input type="submit" value="Search"  style="background-color: antiquewhite; border-radius: 5px; padding: 2px;font-size: 27px;font-family: Amatic SC; width: 70px;">
                    </form>
                </div>
            </center>
            <br>
            <br>

            <table>
                <col width="10%">
                <col width="10%">
                <col width="10%">
                <col width="10%">
                <col width="10%">
                <col width="10%">
                <col width="10%">
                <col width="10%">
                <tr>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Age</th>
                    <th>Phone</th>
                    <th>Gender</th>
                </tr>
                <%
                    ArrayList<Customer> al = null;
                    al = (ArrayList<Customer>) request.getAttribute("searchcus");
                    if (al != null) {
                        for (Customer m : al) {
                %>
                <tr>
                    <td><%=m.getC_username()%></td>
                    <td><%=m.getC_password()%></td>
                    <td><%=m.getC_name()%></td>
                    <td><%=m.getAddress()%></td>
                    <td><%=m.getEmail()%></td>
                    <td><%=m.getAge()%></td>
                    <td><%=m.getPhone()%></td>
                    <td><%=m.getGender()%></td>
                </tr>
                <%
                    }
                } else {
                    Customer c = new Customer();
                    ArrayList<Customer> customer = c.getAllCus();
                    if (customer != null) {
                        for (Customer x : customer) {

                %>
                <tr>
                    <td><%=x.getC_username()%></td>
                    <td><%=x.getC_password()%></td>
                    <td><%=x.getC_name()%></td>
                    <td><%=x.getAddress()%></td>
                    <td><%=x.getEmail()%></td>
                    <td><%=x.getAge()%></td>
                    <td><%=x.getPhone()%></td>
                    <td><%=x.getGender()%></td>
                </tr>


                <%
                            }
                        }
                    }
                %>
            </table>
            <br><br>
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
