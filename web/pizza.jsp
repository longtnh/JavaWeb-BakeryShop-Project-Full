

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pizza - Lighthouse Shop</title>
        <link rel="stylesheet" type="text/css" href="./style/project.css">
        <link rel="icon" href="./image/lighthouse.png" type="image/gif" sizes="16x16">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script type="text/javascript">
            function pizza() {
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
        <header id="header-background3">

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
                <h1 style="text-align: center;font-size: 50px;">Pizza</h1>
                <img id="img" src="./image/pizza3.jpg" height="433" width="250" style="border-radius: 20px;">
                <p style="font-size: 30px; text-indent: 30px;" align="justify">Pizza is a regular visitor to our house — only it doesn't usually come from a delivery person. Making homemade pizza from prepared dough is a quick and easy dinner any night of the week. Even making your own dough only really adds a few minutes to the prep time! Pile on your favorite toppings and get ready to chow down.</p>
            </aside>
            <article>
                <h1 style="text-align: center;font-size: 45px;">How to make Pizza</h1>
                <h2 style="font-size: 36px;">INGREDIENTS</h2>
                <p style="font-size: 24px;"> - 1 pound pizza dough, at room temperature for at least 1 hour<br>
                    - 1/2 to 1 cup sauce: tomato sauce, white sauce, or other spread<br>
                    - 2 to 3 cups other toppings: sautéed onions, sautéed mushrooms, pepperoni, cooked sausage, cooked bacon, diced peppers, leftover veggies, or any other favorite toppings<br>
                    - 1 to 2 cups shredded or sliced cheese (4 to 8 ounces) such as mozzarella, Monterey Jack, provolone, fontina, or any other favorite<br>
                    - Cornmeal or all-purpose flour (optional)</p>
                <h2 style="font-size: 36px;">Equipment</h2>
                <p style="font-size: 24px;"> - Pizza stone or baking sheet<br>
                    - Pizza peel or baking sheet<br>
                    - Parchment paper (optional)</p>
                <img id="img" src="./image/pizza2.jpg" width="560" height="315" style="border-radius: 20px;">
                <h2 style="font-size: 36px;">INSTRUCTIONS</h2>
                <p style="font-size: 24px;" align="justify"> 1. Heat the oven to 550°F or higher : Arrange a rack in the lower-middle part of the oven (if you have a baking stone, place it on the rack) and heat the oven to 550°F or higher. Don't be afraid to really crank the heat up to its highest setting, as the high heat will help make a crunchier and more flavorful crust. Let the oven heat for at least 30 minutes.<br><br>

                    2. Divide the dough in half : One pound of dough makes 2 (10-inch) pizzas. Divide the dough in half and cover one half with an upside-down bowl or a clean kitchen towel while you prepare the first pizza.<br><br>

                    3. Roll out the dough :<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Method #1: Pizza Baked on Parchment: Tear off a large piece of parchment paper roughly 12 inches long. Working with one piece of the dough at a time, form it into a large disk with your hands and place it on the parchment. Use your hands or a rolling pin to flatten the dough until it is 1/4-inch thick or less. If the dough starts to shrink back, let it rest for 5 minutes and then continue rolling.<br>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Method #2: Pizza with Cornmeal or Flour and a Baking Stone: Sprinkle a handful of cornmeal or flour on a pizza peel or on an upside-down rimmed baking sheet. Working with one piece of the dough at a time, form it into a large disk with your hands and place it on the peel. Use your hands or a rolling pin to flatten the dough until it is 1/4-inch thick or less. Shake the peel or baking sheet frequently as you shape to make sure the dough isn't sticking. If the dough starts to shrink back, let it rest for 5 minutes and then continue rolling.<br>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Method #3: Pizza Baked on a Baking Sheet: Brush a thin film of olive oil on a baking sheet. Working with one piece of the dough at a time, form it into a large disk with your hands and place it on the baking sheet. Use your hands or a rolling pin to flatten the dough until it is 1/4-inch thick or less. If the dough starts to shrink back, let it rest for 5 minutes and then continue rolling.<br><br>

                    4. Top the pizza. Spoon half of the sauce onto the center of the pizza and use the back of the spoon to spread it out to the edges. Pile on half of the toppings and half of the cheese.<br><br>

                    5. Bake the pizza. Using a pizza peel or the back side of a baking sheet, slide your pizza (with the parchment or with the cornmeal) onto the baking stone. If you don't have a baking stone, bake the pizza right on the baking sheet. Bake for 5 minutes, then rotate the pizza. If using parchment, slide it out from under the pizza and discard. Bake until the crust is golden-brown and the cheese is melted and browned in spots, 3 to 5 minutes more.<br><br>

                    6. Slice and serve. Transfer the pizza to a cooling rack and let cool slightly, just until you're able to handle it. Transfer to a cutting board, slice into pieces, and serve. Repeat making a second pizza with the remaining dough, cheese, and toppings.</p>
                <center>
                    <p style="font-size: 30px;">You can see the video :</p>
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/sv3TXMSv6Lw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                </center>
            </article>
        </section>
        <div class="div2" style="background-color: #43A3F4;">
            <div class="right">
                <p style="text-align: center; font-size: 40px;"><b>How to make Bubble Milk Tea</b></p>
                <center>
                    <a href="milktea.jsp" target="_blank">
                        <img src="./image/milktea.jpg" height="200" width="350" style="border-radius: 20px;"><br></a></center>
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
