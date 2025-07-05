<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="StaffAdmin.model.Appointment" %>
<%@ page import="customer.model.Pet" %>
<%@ page import="customer.model.Service" %>
<%@ page import="StaffAdmin.model.Result" %>
<%@ page import="java.util.Optional" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Update Result Appointment</title>
    <link rel="stylesheet" href="css/StaffUpdateResultAppointment.css">
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
            <li><a href="StaffAdminController?action=listStaff">Staff</a></li> 
            <li><a href="StaffAdminController?action=getProfile">Profile</a></li>
            <li><a href="StaffAdminController?action=logout">Logout</a></li>
        </ul>
    </nav>

    <header id="home">
        <div class="section__container header__container">
            <div class="header__content">
                <h1 style="text-align: center;">Update Appointment Result</h1>
                <h2>Update Detailed Information</h2>
                <br>
                <div class="form-wrapper">
                    <form action="AppointmentController?action=updateAppointmentAndResult" method="post">
                        <input type="hidden" name="appId" value="${appointment.appId}">

                        <label>Appointment ID:</label>
                        <input type="text" value="${appointment.appId}" disabled>

                        <label>Pet Name:</label>
                        <input type="text" value="${appointment.pet.petName}" disabled>

                        <label>Service Name:</label>
                        <input type="text" value="${appointment.service.serviceName}" disabled>

                        <label>Appointment Date:</label>
                        <input type="text" value="${appointment.appDate}" disabled>

                        <label>Appointment Time:</label>
                        <input type="text" value="${appointment.appTime}" disabled>

                        <label>Status:</label>
                        <select name="status">
                            <option value="Pending" ${appointment.status == 'Pending' ? 'selected' : ''}>Pending</option>
                            <option value="Approved" ${appointment.status == 'Approved' ? 'selected' : ''}>Approved</option>
                            <option value="In Progress" ${appointment.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                            <option value="Completed" ${appointment.status == 'Completed' ? 'selected' : ''}>Completed</option>
                            <option value="Rejected" ${appointment.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                        </select>

                        <h2>Update Pet Health Result</h2>

                        <label>Temperament:</label>
                        <input type="text" name="tempDescription" value="${result.tempDescription}">

                        <label>Body:</label>
                        <input type="text" name="body" value="${result.body}">

                        <label>Ear:</label>
                        <input type="text" name="ear" value="${result.ear}">

                        <label>Nose:</label>
                        <input type="text" name="nose" value="${result.nose}">

                        <label>Tail:</label>
                        <input type="text" name="tail" value="${result.tail}">

                        <label>Mouth:</label>
                        <input type="text" name="mouth" value="${result.mouth}">

                        <label>Other Notes:</label>
                        <input type="text" name="other" value="${result.other}">

                        <div class="button-group">
                            <button type="button" class="cancel-button" onclick="cancelUpdate()">Back</button>
                            <button class="submit-button" type="submit">Update Appointment</button>
                        </div>
                    </form>
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

    <script>
        function cancelUpdate() {
            window.location.href = 'AppointmentController?action=goBackToAppointmentList';
        }
    </script>
</body>
</html>
