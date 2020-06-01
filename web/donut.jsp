

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Donut - Lighthouse Shop</title>
        <link rel="stylesheet" type="text/css" href="./style/project.css">
        <link rel="icon" href="./image/lighthouse.png" type="image/gif" sizes="16x16">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script type="text/javascript">
            function donut() {
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
        <header id="header-background5">

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
                <h1 style="text-align: center; font-size: 50px;">Donut</h1>
                <center><img src="./image/donut2.jpg" height="180" width="270"  style="border-radius: 20px;"></center>
                <p  style="font-size: 30px; text-indent: 30px;" align="justify">Doughnuts (also spelled donuts) are deep-fried pastries made from dough. Doughnutlike fried pastries appear in many forms the world over, from savory to sweet. However, in the United States, doughnuts are most often sweet treats, commonly enjoyed at breakfast or as a midmorning or midafternoon snack. Although doughnuts are sometimes filled with jam or pastry cream, the most common American doughnut type is circular with a hole in the middle -- it looks like a puffy, chubby ring.</p>
            </aside>
            <article>
                <h1 style="text-align: center; font-size: 45px;">How to make Donut</h1>
                <h2 style="font-size: 36px;">Ingredients</h2>
                <p style="font-size: 24px;">For the Donuts:<br><br>

                    - 1-1/8 cup whole milk, warm<br>
                    - 1/4 cup sugar<br>
                    - 2-1/4 teaspoons (one package) Instant Or Active Dry Yeast<br>
                    - 2 whole large eggs, lightly beaten<br>
                    - 1 and 1/4 stick unsalted butter (10 tablespoons), melted<br>
                    - 4 cups all-purpose flour<br>
                    - 1/2 teaspoon salt<br>
                    - Shortening/oil for frying<br><br>
                    - Glaze for hot yeast donuts:<br><br>

                    - 4 tablespoons salted butter, melted<br>
                    - 1 teaspoon vanilla<br>
                    - 3 cups powdered sugar<br>
                    - Enough milk to make a thin icing (about 1/2 cup)</p>
                <h2 style="font-size: 36px;">INSTRUCTIONS</h2>
                <center><img src="./image/donut3.jpg" width="560" height="315"  style="border-radius: 20px;"></center>
                <p style="font-size: 24px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.To make the dough: warm the milk until it is getting nice and warm when you dip your finger in it (about 105 degrees). Add the milk to a mixing bowl or the bowl of your stand mixer. Add the sugar and stir to dissolve. Add the yeast and stir to combine. Let the yeast rest for 5 minutes.<br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.Add the beaten eggs and melted butter to the bowl and stir to combine.<br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.While the mixer is running slowly, add the flour and salt and mix until the dough comes together. Mix for a whole five minutes to work the dough well. Turn off the bowl and let the dough sit in the bowl of the mixer for 10 minutes.<br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.After the rest period turn the dough out into a lightly oiled bowl, cover the bowl with plastic wrap and refrigerate the dough for at least 8 hours up to overnight.<br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5.To form the donuts: Remove the dough from the fridge and roll it out on a lightly floured surface until it is 1/2 to 1/3 of an inch thick. Use a three-inch donut cutter to cut out the donuts.<br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.Place the cut donuts and holes on a lightly greased baking sheet.<br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7.Repeat with the remaining dough.<br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8.Cover the donuts and let them rise until doubled in size, about one hour. The donuts will be very puffy and airy looking.<br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9.To fry the donuts: Heat a few inches of oil or shortening in a large cast iron skillet or fryer over medium heat until the oil reaches 365 to 375 degrees (use a thermometer!). Carefully add the donuts to the hot oil and fry until golden brown, about 1 1/2 minutes per side. The donut holes will only take about 30 seconds per side.<br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10.Use a slotted spoon to remove the donuts from the hot oil and place them on a paper towel lined baking sheet to remove extra grease. Let them cool slightly. Dip the hot donuts in the glaze and enjoy right away.<br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11.For the Glaze: Just combine all the ingredients in a medium bowl and mix until smooth. Add just enough milk to make thin icing. Once the donuts are dipped halfway in the icing take them out, turn them icing side up, and place them on a cooling rack set inside a baking sheet (to catch the drips).
                </p>
                <center>
                    <p style="font-size: 30px;"><b>You can see the video :</b></p>
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/tojsUHxmOrQ" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                </center>
            </article>
        </section>
        <div class="div2" style="background-color: #43A3F4;">
            <div class="right">
                <p style="text-align: center; font-size: 40px;"><b>How to make Pizza</b></p>
                <center>
                    <a href="pizza.html" target="_blank">
                        <img src="./image/pizza4.jpg" height="200" width="350" style="border-radius: 20px;"><br></a></center>
                <br>
            </div>
            <div class="center">
                <p style="text-align: center; font-size: 40px;"><b>How to make Cupcake</b></p>
                <center>
                    <a href="cupcake.html" target="_blank">
                        <img src="./image/cupcake6.jpg" height="200" width="350" style="border-radius: 20px;"><br></a></center>
                <br>
            </div>
            <div class="left">
                <p style="text-align: center; font-size: 40px;"><b>How to make Bubble Milk Tea</b></p>
                <center>
                    <a href="milktea.html" target="_blank">
                        <img src="./image/milktea.jpg" height="200" width="350" style="border-radius: 20px;"><br></a></center>
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
