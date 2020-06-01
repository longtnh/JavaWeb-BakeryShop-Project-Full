

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cup Cake - Lighthouse Shop</title>
        <link rel="stylesheet" type="text/css" href="./style/project.css">
        <link rel="icon" href="./image/lighthouse.png" type="image/gif" sizes="16x16">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script type="text/javascript">
            function cupCake() {
                alert("Thanks You, We will contact with you !!");
            }
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
        <header id="header-background4">

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
        <section>
            <aside>
                <h1 style="text-align: center; font-size: 50px;">Cup Cake</h1>
                <center><img src="./image/cupcake4.jpg" height="150" width="300" style="border-radius: 20px;"></center>
                <p style="font-size: 30px; text-indent: 30px;" align="justify">Cupcakes are a universally loved, individual-size cake that can be customized with frosting, sprinkles, flavor mix-ins, cake-mix variations, and much, much more. These indulgent treats offer a sweet personal touch with different ways to design and decorate. Each cupcake offers the perfect ratio of cake to frosting, too! Because they are festive and so easy, they are the perfect treat for birthdays, bake sales, showers, parties and even weeknights. We love that you can change up the flavor with just a few ingredients and that you can use a cake mix for a quick fix!</p>
            </aside>
            <article>
                <h1 style="text-align: center; font-size: 45px;">How to make Cup Cake</h1>
                <h2 style="font-size: 36px;">What you'll need</h2>
                <p style="font-size: 24px;"> - Ingredients for Texas Sheet Cake Cupcakes<br>
                    - Large bowl<br>
                    - Regular-size muffin pan (12 count)<br>
                    - Paper baking cups<br>
                    - One-quart sauce pan</p>
                <h2 style="font-size: 36px;">How to : </h2>
                <center><img src="./image/cupcake5.jpg" width="560" height="315" style="border-radius: 20px;"></center>
                <p style="font-size: 24px;">Step 1: Gather your cupcake ingredients.<br><br>
                    Step 2: Preheat oven to 325°F. Place paper baking cups in 24 regular-size muffin cups.<br><br>
                    Step 3: In large bowl, mix the flour, granulated sugar and salt with a whisk. Set aside.<br><br>
                    Step 4: Using a one-quart saucepan, heat one cup of butter, water, and three tablespoons of baking cocoa to boiling.<br><br>
                    Step 5: Remove from heat and pour into flour mixture. Mix to combine. Add buttermilk, baking soda, vanilla, bourbon and eggs. Mix well to combine and then fold in chopped pecans. Divide the batter evenly among muffin cups, filling them two-thirds full. Bake for 20 to 25 minutes.<br><br>
                    Step 6: Meanwhile, gather your ingredients for the frosting.<br><br>
                    Step 7: Using a one-quart saucepan, heat butter, baking cocoa and milk to simmering. Remove from heat, beat in powdered sugar and bourbon. Spoon warm icing over warm cupcakes and top with pecan halves.
                </p>
                <center>
                    <p style="font-size: 30px;"><b>You can see the video :</b></p>
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/jhmYWNEW-Y8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                </center>
            </article>
        </section>
        <div class="div2" style="background-color: #43A3F4;">
            <div class="right">
                <p style="text-align: center; font-size: 40px;"><b>How to make Pizza</b></p>
                <center>
                    <a href="pizza.jsp" target="_blank">
                        <img src="./image/pizza4.jpg" height="200" width="350" style="border-radius: 20px;"><br></a></center>
                <br>
            </div>
            <div class="center">
                <p style="text-align: center; font-size: 40px;"><b>How to make Bubble Milk Tea</b></p>
                <center>
                    <a href="milktea.jsp" target="_blank">
                        <img src="./image/milktea.jpg" height="200" width="350" style="border-radius: 20px;"><br></a></center>
                <br>
            </div>
            <div class="left">
                <p style="text-align: center; font-size: 40px;"><b>How to make Donut</b></p>
                <center>
                    <a href="donut.jsp" target="_blank">
                        <img src="./image/donut4.jpg" height="200" width="350" style="border-radius: 20px;"><br></a></center>
                <br>
            </div>
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
