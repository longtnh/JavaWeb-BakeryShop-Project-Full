
<%@page import="model.Product"%>
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

        <div style="background-color: #D9A056; padding: 0px 30px 30px 30px">
            <br><br>
            <form enctype="multipart/form-data" method="Post" action="addProduct">
                <div class="div2">
                    <div style="flex: 35%;">
                        <center>

                            <img height="300px" width="300px" style="border-radius: 5px;">
                            <input id="photoToUpload" accept=".png, .jpg, .jpeg" type="file" name="photo" style="font-family: Amatic SC; font-size: 20px; color: white;padding: 12px 20px;border: none;border-radius: 4px;cursor: pointer;">

                        </center>
                    </div>
                    <div style="flex: 65%;">                            
                        <input class="add-input" name="name" type="text" placeholder="Name Product : " style="font-size: 40px;width: 70%;">
                        <br>
                        <br>
                        <hr style="border: 2px solid black">
                        <br>
                        <select name="type" class="add-input" style="font-size: 30px; width: 70%">
                            <option value="Cookie" selected>Cookie</option>
                            <option value="Cake">Cake</option>
                            <option value="Drink">Drink</option>
                        </select>
                        <br>
                        <p style="font-size: 30px"><input name="price" class="add-input" type="text" placeholder="Price : " style="font-size: 30px; width: 20%;">.000 VND</p>
                        <input class="add-input" name="stock" type="number" placeholder="Stock : " value="1" style="font-size: 30px;width: 20%">
                        <br>
                        <br>
                        <input type="submit" value="Add Product" id="submit1" style="font-family: Amatic SC; font-size: 30px; color: white;padding: 12px 20px;border: none;border-radius: 4px;cursor: pointer;">   
                    </div>                     
                </div>
                <br><br>
                <label style="font-size: 35px; font-weight: bold; padding: 0px 75px 0px 75px">Description : </label>
                <br>
                <textarea name="de" id="subject" placeholder="Some information : ... " style="height: 200px; font-family: Amatic SC; font-size: 30px; width: 90%"></textarea>            
            </form>                        
        </div>

        <script>
            let inputEle = document.getElementById("photoToUpload");
            String
            path = inputEle.value;
        </script>                            

        <footer id="contact">
            <h1 style="text-align: center; font-size: 50px;">Contact</h1>
            <center>
                <p style="font-size: 35px;"><i class="material-icons" style="font-size: 30px">location_on</i><b> Address : 53 Hai Ho, Da Nang</b></p>
                <img src="./image/Untitled.png" height="300px">
                <p style="font-size: 35px;"><i class="fa fa-phone" style="font-size:30px"></i><b> 0947241092 (Mr. Hai Dang )</b></p>
                <p style="font-size: 35px;"><i class='fas fa-envelope' style='font-size:30px'></i><b> dungculambanh.lighthouse@gmail.com</b></p>

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
