<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Pet</title>
    <link rel="stylesheet" href="css/CustomerEditPet.css">
    <script>
        function validateForm() {
            var petName = document.getElementById("petName").value.trim();
            var petWeight = document.getElementById("petWeight").value.trim();

            // Check if fields are empty
            if (petName === "" || petWeight === "") {
                alert("Please fill in all fields.");
                return false;
            }

            // Pet name: allow only letters and spaces
            var nameRegex = /^[A-Za-z\s]+$/;
            if (!nameRegex.test(petName)) {
                alert("Pet name must contain only letters and spaces.");
                return false;
            }

            // Pet weight: must be a number > 0
            var weight = parseFloat(petWeight);
            if (isNaN(weight) || weight <= 0) {
                alert("Pet weight must be a number greater than 0.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <!-- Navigation bar -->
    <nav>
        <div class="nav__header">
            <div class="nav__logo">
                <a href="#">NikkoSpace</a>
            </div>
            <div class="nav__menu__btn" id="menu-btn">
                <i class="ri-menu-line"></i>
            </div>
        </div>
        <ul class="nav__links" id="nav-links">
            <li><a href="CustomerIndexHome.jsp">Home</a></li>
            <li><a href="PetController?action=getPetList">Pet</a></li>
            <li><a href="AppointmentController?action=getAppointmentList">Appointment</a></li>
            <li><a href="CustomerServiceController?action=listServices">Service</a></li>
            <li><a href="CustomerController?action=getProfile">Profile</a></li>
            <li><a href="CustomerController?action=logout">Logout</a></li>
        </ul>
    </nav>

    <!-- Header Section -->
    <header id="home">
        <div class="section__container header__container">
            <div class="header__content">
                <h1 style="text-align: center;">Edit Pet</h1>
                <h2 style="text-align: center;">Update Your Pet's Information</h2>
                
                <div class="form-container">
                    <form action="PetController" method="post" onsubmit="return validateForm()">
                        <input type="hidden" name="action" value="updatePet">
                        <input type="hidden" name="petID" value="<%= request.getAttribute("petID") %>">

                        <div class="form-group">
                            <label for="petName">Pet Name:</label>
                            <input type="text" id="petName" name="petName" value="<%= request.getAttribute("petName") %>" required>
                        </div>

                        <div class="form-group">
                            <label for="petWeight">Pet Weight:</label>
                            <input type="number" id="petWeight" name="petWeight" value="<%= request.getAttribute("petWeight") %>" step="0.01" required>
                        </div>

                        <div class="form-group">
                            <label for="petStatus">Pet Status:</label>
                            <select id="petStatus" name="petStatus">
                                <option value="Alive" <%= "Alive".equals(request.getAttribute("petStatus")) ? "selected" : "" %>>Alive</option>
                                <option value="Dead" <%= "Dead".equals(request.getAttribute("petStatus")) ? "selected" : "" %>>Dead</option>
                            </select>
                        </div>

                        <div class="button-container">
                            <button type="submit" class="btn btn-primary">Update</button>
                            <button type="button" class="btn btn-cancel" onclick="window.location.href='PetController?action=getPetList'">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </header>

    <!-- Footer -->
    <footer class="footer">
        <div class="main_container footer_container">
            <div class="footer_item">
                <img src="images/nikkospacelogo.png" alt="" style="max-width: 35%; height: auto; margin: 0 45%; display: block;">
                <div class="footer_p">Your Pets Are Our Priority</div>
            </div>
            <div class="footer_item">
                <h3 class="footer_item_title">Reach Us</h3>
                <ul class="footer_list">
                    <li class="footer_list_item"><a href="https://www.google.com/maps/place/...">Jasin, Melaka</a></li>
                    <li class="footer_list_item"><a href="mailto:capal@gmail.com">NikkoSpace@gmail.com</a></li>
                    <li class="footer_list_item"><a href="tel:+601923445265">+6019-2344 5265</a></li>
                    <li class="footer_list_item"><a href="tel:+601762500959">+6017 6250 0959</a></li>
                </ul>
            </div>
            <div class="footer_item">
                <h3 class="footer_item_title">Support</h3>
                <ul class="footer_list">
                    <li class="footer_list_item"><a href="product.html">Our Store</a></li>
                    <li class="footer_list_item"><a href="login.html">Login / Register</a></li>
                    <li class="footer_list_item"><a href="cart.html">Cart</a></li>
                    <li class="footer_list_item"><a href="product.html">Shop</a></li>
                </ul>
            </div>
            <div class="footer_item">
                <h3 class="footer_item_title">Help</h3>
                <ul class="footer_list">
                    <li class="footer_list_item"><a href="#">Privacy Policy</a></li>
                    <li class="footer_list_item"><a href="#">Terms of Use</a></li>
                    <li class="footer_list_item"><a href="#">FAQ's</a></li>
                    <li class="footer_list_item"><a href="#">Contact</a></li>
                </ul>
            </div>
        </div>
        <div class="footer_bottom">
            <div class="footer_bottom_container">
                <p class="footer_copy">Copyright NikkoSpace 2024. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>
