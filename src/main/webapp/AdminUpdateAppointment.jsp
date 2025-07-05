<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="StaffAdmin.model.Appointment" %>
<%@ page import="customer.model.Pet" %>
<%@ page import="customer.model.Service" %>
<%@ page import="StaffAdmin.model.Result" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    Appointment appointment = (Appointment) request.getAttribute("appointment");
    Result result = (Result) request.getAttribute("result");

    String formattedTime = "";
    try {
        SimpleDateFormat inputFormat = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat outputFormat = new SimpleDateFormat("hh:mm a");
        Date time = inputFormat.parse(appointment.getAppTime());
        formattedTime = outputFormat.format(time);
    } catch (Exception e) {
        formattedTime = appointment.getAppTime();
    }
%>
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
                        <input type="hidden" name="appId" value="<%= appointment.getAppId() %>">

                        <label>Appointment ID:</label>
                        <input type="text" value="<%= appointment.getAppId() %>" disabled>

                        <label>Pet Name:</label>
                        <input type="text" value="<%= appointment.getPet().getPetName() %>" disabled>

                        <label>Service Name:</label>
                        <input type="text" value="<%= appointment.getService().getServiceName() %>" disabled>

                        <label>Appointment Date:</label>
                        <input type="text" value="<%= appointment.getAppDate() %>" disabled>

                        <label>Appointment Time:</label>
                        <input type="text" value="<%= formattedTime %>" disabled>

                        <label>Status:</label>
                        <select name="status">
                            <option value="Pending" <%= "Pending".equals(appointment.getStatus()) ? "selected" : "" %>>Pending</option>
                            <option value="Approved" <%= "Approved".equals(appointment.getStatus()) ? "selected" : "" %>>Approved</option>
                            <option value="In Progress" <%= "In Progress".equals(appointment.getStatus()) ? "selected" : "" %>>In Progress</option>
                            <option value="Completed" <%= "Completed".equals(appointment.getStatus()) ? "selected" : "" %>>Completed</option>
                            <option value="Rejected" <%= "Rejected".equals(appointment.getStatus()) ? "selected" : "" %>>Rejected</option>
                        </select>

                        <h2>Update Pet Health Result</h2>

                        <label>Temperament:</label>
                        <input type="text" name="tempDescription" value="<%= result != null ? result.getTempDescription() : "" %>">

                        <label>Body:</label>
                        <input type="text" name="body" value="<%= result != null ? result.getBody() : "" %>">

                        <label>Ear:</label>
                        <input type="text" name="ear" value="<%= result != null ? result.getEar() : "" %>">

                        <label>Nose:</label>
                        <input type="text" name="nose" value="<%= result != null ? result.getNose() : "" %>">

                        <label>Tail:</label>
                        <input type="text" name="tail" value="<%= result != null ? result.getTail() : "" %>">

                        <label>Mouth:</label>
                        <input type="text" name="mouth" value="<%= result != null ? result.getMouth() : "" %>">

                        <label>Other Notes:</label>
                        <input type="text" name="other" value="<%= result != null ? result.getOther() : "" %>">

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
                <img src="images/nikkospacelogo.png" alt="" style="max-width: 35%; height: auto; margin: 0 45%; display: block;">
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
