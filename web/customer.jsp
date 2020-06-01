
<%@page import="model.Customer"%>
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
                font-size: 31.5px;
                padding: 0px;
                margin: 0px;
            }
            input {
                padding: 0px;
                margin: 0px;
            }
            input[type=text]:hover{
                background-color: white;
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
                        String uname = (String) s.getAttribute("uname");
                        String role = (String) s.getAttribute("role");
                        Customer x = new Customer();
                        x = x.getCus(uname);
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
        <div style="background-color: #D9A056; ">
            <form action="updateCustomer" method="POST" onsubmit="return check()">

                <br>
                <br>
                <h1 style="font-size: 45px; text-align: center">Customer's Profile</h1>
                <hr>
                <div class="div2">
                    <div class="div3" style="flex: 15%">
                        <label><b>User Name : </b></label><br><br>
                        <label><b>Password : </b></label><br><br>
                        <label><b>Name : </b></label><br><br>
                        <label><b>Address : </b></label><br><br>
                        <label><b>Age : </b></label><br><br>
                        <label><b>Email : </b></label><br><br>
                        <label><b>Phone Number : </b></label><br><br>
                        <label><b>Gender : </b></label>
                    </div>
                    <div class="div4" style="flex: 85%">

                        <!--                        <label><b>Age : </b></label><input type="text" name="age" value="" style="width: 60% ;font-size: 30px; font-family: Amatic SC; background-color: #D9A056;border-width: 1px; border-color: black"><br><br>
                                                <label><b>Email : </b></label><input type="text" name="email" value="" style="width: 60% ;font-size: 30px; font-family: Amatic SC; background-color: #D9A056; border-width: 1px; border-color: black"><br><br>
                                                <label><b>Phone Number : </b></label><input type="text" name="phone" value="" style="width: 60% ;font-size: 30px; font-family: Amatic SC; background-color: #D9A056; border-width: 1px; border-color: black"><br><br>
                                                <label><b>Gender : </b></label><input type="text" name="gender" value="" style="width: 60% ;font-size: 30px; font-family: Amatic SC; background-color: #D9A056; border-width: 1px; border-color: black">-->
                        <label>${uname}</label><input type="hidden" name="uname" value="${uname}" style="width: 60% ;font-size: 30px; font-family: Amatic SC; background-color: #D9A056; border: none;"><br><br>
                        <input id="password" required type="password" name="password" value="<%=x.getC_password()%>" style="width: 70% ;font-size: 30px; font-family: Amatic SC; background-color: #D9A056; border-width: 1px; border-color: black"><br><br>
                        <input id="cname" required type="text" name="cname" value="<%=x.getC_name()%>" style="width: 70% ;font-size: 30px; font-family: Amatic SC; background-color: #D9A056; border-width: 1px; border-color: black"><br><br>
                        <input id="address" required type="text" name="address" value="<%=x.getAddress()%>" style="width: 70% ;font-size: 30px; font-family: Amatic SC; background-color: #D9A056; border-width: 1px; border-color: black"><br><br>
                        <input id="age" required type="text" name="age" value="<%=x.getAge()%>" style="width: 70% ;font-size: 30px; font-family: Amatic SC; background-color: #D9A056;border-width: 1px; border-color: black"><br><br>
                        <input id="email" required type="text" name="email" value="<%=x.getEmail()%>" style="width: 70% ;font-size: 30px; font-family: Amatic SC; background-color: #D9A056; border-width: 1px; border-color: black"><br><br>
                        <input id="phone" required type="text" name="phone" value="<%=x.getPhone()%>" style="width: 70% ;font-size: 30px; font-family: Amatic SC; background-color: #D9A056; border-width: 1px; border-color: black"><br><br>
                        <input id="gender" required type="text" name="gender" value="<%=x.getGender()%>" style="width: 70% ;font-size: 30px; font-family: Amatic SC; background-color: #D9A056; border-width: 1px; border-color: black">
                    </div>

                </div>
                <center>
                    <br><br><br>
                    <a href="historyBill.jsp" style="text-decoration: none;font-family: Amatic SC; font-size: 24px; color: white;padding: 12px 20px;border: none;border-radius: 4px;cursor: pointer;background-color:#444 ">HISTORY</a>
                    &nbsp;
                    <input type="submit" value="UPDATE" id="submit1" style="font-family: Amatic SC; font-size: 24px; color: white;padding: 12px 20px;border: none;border-radius: 4px;cursor: pointer;">
                    <br><br>
                </center>
            </form>
            <!--                    <center>
                                    <a href="cart?page=delete&action=order&id=0" style="text-decoration: none"><input type="submit" value="OK" id="submit1" style="font-family: Amatic SC; font-size: 28px"></a>
                                    <a href="cart?page=delete&action=order&id=0" style="text-decoration: none"><input type="submit" value="OK" id="submit1" style="font-family: Amatic SC; font-size: 28px"></a>
                                </center>-->
        </div>

        <script>
            function check() {
                var js_email = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if (!js_email.test(email.value)) {
                    alert("Your Email is not valid");
                    return false;
                }
                else if (parseInt(age.value) < 10) {
                    alert("Your age must be more than 10 years old");
                    return false;
                }
                else if (password.value.length < 8) {
                    alert("Your password must be more than 8 characters");
                    return false;
                }
                else if (phone.value.length != 10 || !phone.value.match("^0[0-9]")) {
                    alert("Your phone number is not correct");
                    return false;
                }
                else if (!document.getElementById("gender").value.equals("Nam") || !document.getElementById("gender").value.equals("Nữ") ||
                        !document.getElementById("gender").value.equals("Female") || !document.getElementById("gender").value.equals("Male")) {
                    alert("Your gender is not correct");
                    return false;
                }
                else
                    return true;
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


