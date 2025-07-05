<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="StaffAdmin.model.Appointment" %>
<%@ page import="customer.model.Pet" %>
<%@ page import="customer.model.Service" %>
<%@ page import="StaffAdmin.model.Result"%>
<%@ page import="java.util.Optional" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Staff View Appointment Details</title>
    <link rel="stylesheet" href="css/StaffViewAppointment.css">
</head>
<body>
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
        <li><a href="AppointmentController?action=getPendingAppointments">Appointments</a></li>
        <li><a href="CustomerController?action=listCustomer">Customer</a></li>
        <li><a href="ServiceController?action=listServices">Service</a></li>
        <li><a href="StaffAdminController?action=getProfile">Profile</a></li>
        <li><a href="StaffAdminController?action=logout">Logout</a></li>
    </ul>
</nav>

<header id="home">
    <div class="section__container header__container">
        <div class="header__content">
            <h1 style="text-align: center;">Customer's Pet Appointment Details</h1>
            <h2 style="text-align: center;">Details of the customer pet appointment</h2>

            <div class="container">
                <table>
                    <thead>
                        <tr>
                            <th>Field</th>
                            <th>Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            Appointment appointment = (Appointment) request.getAttribute("appointment");
                            if (appointment != null) {
                                Pet pet = appointment.getPet();
                                Service service = appointment.getService();
                                SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm a");
                        %>
                        <tr>
                            <td>Appointment ID</td>
                            <td><%= appointment.getAppId() %></td>
                        </tr>
                        <tr>
                            <td>Pet Name</td>
                            <td><%= (pet != null) ? pet.getPetName() : "N/A" %></td>
                        </tr>
                        <tr>
                            <td>Service Name</td>
                            <td><%= (service != null) ? service.getServiceName() : "N/A" %></td>
                        </tr>
                        <tr>
                            <td>Appointment Date</td>
                            <td><%= appointment.getAppDate() %></td>
                        </tr>
                        <tr>
                            <td>Appointment Time</td>
                            <td><%= timeFormat.format(appointment.getAppTime()) %></td>
                        </tr>
                        <tr>
                            <td>Add-On Service</td>
                            <td><%= Optional.ofNullable(appointment.getAppRemark()).orElse("None") %></td>
                        </tr>
                        <tr>
                            <td>Status</td>
                            <td><%= appointment.getStatus() %></td>
                        </tr>
                        <% } else { %>
                        <tr>
                            <td colspan="2" style="text-align: center; color: red;">Appointment details not found.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <h2 style="text-align: center;">Result of your pet</h2>
            <div class="container">
                <table>
                    <thead>
                        <tr>
                            <th>Category</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Result result = (Result) request.getAttribute("result");
                            if (result != null) {
                        %>
                        <tr><td>Temperament</td><td><%= result.getTempDescription() %></td></tr>
                        <tr><td>Body</td><td><%= result.getBody() %></td></tr>
                        <tr><td>Ear</td><td><%= result.getEar() %></td></tr>
                        <tr><td>Nose</td><td><%= result.getNose() %></td></tr>
                        <tr><td>Tail</td><td><%= result.getTail() %></td></tr>
                        <tr><td>Mouth</td><td><%= result.getMouth() %></td></tr>
                        <tr><td>Others</td><td><%= result.getOther() %></td></tr>
                        <% } else { %>
                        <tr>
                            <td colspan="2">No result details found.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <div class="header__btn" style="text-align: center; margin-top: 20px;">
                <button onclick="window.location.href='AppointmentController?action=goBackToAppointmentList'">
                    Back <span><i class="ri-arrow-right-line"></i></span>
                </button>
            </div>
        </div>
    </div>
</header>

<footer class="footer">
    <div class="main_container footer_container">
        <div class="footer_item">
            <img src="images/nikkospacelogo.png" alt=""
                style="max-width: 35%; height: auto; margin: 0 45%; display: block;">
            <div class="footer_p">Your Pets is Our Priority</div>
        </div>
        <div class="footer_item">
            <h3 class="footer_item_title">Reach Us</h3>
            <ul class="footer_list">
                <li class="footer_list_item">Jasin, Melaka</li>
                <li class="footer_list_item">NikkoSpace@gmail.com</li>
                <li class="footer_list_item">+6019-2344 5265</li>
                <li class="footer_list_item">+6017 6250 0959</li>
            </ul>
        </div>
        <div class="footer_item">
            <h3 class="footer_item_title">Support</h3>
            <ul class="footer_list">
                <li class="footer_list_item">Our Store</li>
                <li class="footer_list_item">Login / Register</li>
                <li class="footer_list_item">Cart</li>
                <li class="footer_list_item">Shop</li>
            </ul>
        </div>
        <div class="footer_item">
            <h3 class="footer_item_title">Help</h3>
            <ul class="footer_list">
                <li class="footer_list_item">Privacy policy</li>
                <li class="footer_list_item">Terms of use</li>
                <li class="footer_list_item">FAQ's</li>
                <li class="footer_list_item">Contact</li>
            </ul>
        </div>
    </div>
    <div class="footer_bottom">
        <div class="footer_bottom_container">
            <p class="footer_copy">Copyright NikkoSpace 2024. All rights reserved.</p>
        </div>
    </div>
</footer>
<script src="https://unpkg.com/scrollreveal"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="main.js"></script>
</body>
</html>
