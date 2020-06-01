
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Milk Tea - Lighthouse Shop</title>
        <link rel="stylesheet" type="text/css" href="./style/project.css">
        <link rel="icon" href="./image/lighthouse.png" type="image/gif" sizes="16x16">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script type="text/javascript">
            function milkTea() {
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
        <header id="header-background2">
            <br>
            <br>
        </header>
        <nav>
            <ul>
                <li><a class="active" href="project.jsp"><b>Home</b></a></li>
                <li><a href="order.jsp"><b>Products</b></a></li>
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
                <h1 style="text-align: center;font-size: 50px;">Milk Tea</h1>
                <p style="font-size: 30px; text-indent: 30px;" align="justify">Bubble tea is one of my favorite things to sip on during the summer. Originating from Taiwan, bubble tea usually consists of sweetened tea with milk and the characteristic chewy tapioca balls, also known as boba. Bubble tea comes in many flavors: plain tea flavors such as black or jasmine tea, fruit flavors such as strawberry or honeydew, and even taro, which is a root vegetable commonly used in Asian dishes.</p>
                <center><img src="./image/milktea3.jpg" height="433" width="250"  style="border-radius: 20px;"></center>
                <p style="font-size: 30px; text-indent: 30px;" align="justify">While I enjoy drinking bubble tea, I don’t particularly like the ones sold in the teahouse chains because they contain too much sugar. The good thing is that you can make bubble tea at home easily! In this bubble tea recipe, all you really need is tea, tapioca pearls, milk, and a sweetener.</p>
            </aside>
            <article>
                <h1 style="text-align: center;font-size: 45px;">How to make Milk Tea</h1>
                <h2 style="font-size: 36px;">INGREDIENTS</h2>
                <p style="font-size: 25px;"> - 8 bags of black tea</p>
                <p style="font-size: 25px;"> - 4 cups just boiled water</p>
                <p style="font-size: 25px;"> - 3/4 cup quick-cooking tapioca pearls</p>
                <p style="font-size: 25px;"> - whole milk to serve (or your choice of milk)</p>
                <p style="font-size: 25px;"> - simple syrup to serve (or your choice of sweetener)</p>
                <h2 style="font-size: 36px;">For the Simple Syrup</h2>
                <p style="font-size: 25px;"> - 1 cup water</p>
                <p style="font-size: 25px;"> - 1 sugar</p>
                <center>
                    <img src="./image/milktea4.jpg" height="315" width="560"  style="border-radius: 20px;">
                </center>
                <h2 style="font-size: 36px;">INSTRUCTIONS</h2>
                <p style="font-size: 25px;"><b>1. Prepare the tea:</b> Steep the tea bags with 4 cups of just boiled water. Let the tea sit until it reaches room temperature. There’s no need to remove the tea bags from the water as the tea is steeping. You can stick the tea in the fridge to speed up the cooling process.</p>
                <p style="font-size: 25px;"><b>2. Prepare the simple syrup (if using):</b> Add the water to a saucepan and heat the water until it starts to simmer. Add the sugar and stir until the sugar dissolves. Remove the saucepan from heat and let the simple syrup cool before transferring to a jar.</p>
                <p style="font-size: 25px;"><b>3. Cook the tapioca pearls:</b> Bring about 4 cups of water to boil and add the tapioca pearls. Stir the pearls and let them cook for about 5 minutes. The pearls should have floated to the top by now. Drain and rinse the pearls under cold water. Transfer them to a bowl.</p>
                <p style="font-size: 25px;"><b>4. Assemble the drinks:</b> Divide the cooked tapioca pearls into 4 large glasses. Next, add a few ice cubes to each glass. Pour 1 cup of the tea into each glass. Add 1 1/2 tablespoons of milk and 1 1/2 tablespoons of simple syrup into each glass. Stir and taste the milk tea. Add more milk or simple syrup to your taste. If you are serving the beverage to guests, have a small pitcher of milk and jar of simple syrup ready so that they can adjust the drink to their taste. The drink is usually served with large boba straws (large enough for the tapioca pearls to go through). If you don’t have the straws on hand, you can use spoons to scoop out the tapioca pearls.</p>
                <center>
                    <p style="font-size: 30px;"><b>You can see the video :</b></p>
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/xebewT6lh2k" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></center>
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
                <p style="text-align: center; font-size: 40px;"><b>How to make Cupcake</b></p>
                <center>
                    <a href="cupcake.jsp" target="_blank">
                        <img src="./image/cupcake6.jpg" height="200" width="350" style="border-radius: 20px;"><br></a></center>
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
