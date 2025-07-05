<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="StaffAdmin.model.Appointment"%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Approved Appointments</title>
    <link rel="stylesheet" href="css/IndexCustomerListAppointment.css">
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
                <h1 style="text-align: center;">Manage Appointments</h1>
                <div style="text-align: center; margin: 20px 0;">
                    <button class="btn-pending" onclick="window.location.href='AppointmentController?action=getPendingAppointments'">Pending</button>
                    <button class="btn-in-progress" onclick="window.location.href='AppointmentController?action=getApprovedAppointments'">Approved</button>
                    <button class="btn-in-progress" onclick="window.location.href='AppointmentController?action=getInProgressAppointments'">In-Progress</button>
                    <button class="btn-complete" onclick="window.location.href='AppointmentController?action=getCompletedAppointments'">Completed</button>
                    <button class="btn-rejected" onclick="window.location.href='AppointmentController?action=getRejectedAppointments'">Rejected</button>
                </div>

                <section class="appointment-list">
                    <div class="container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Application ID</th>
                                    <th>Pet Name</th>
                                    <th>Service Name</th>
                                    <th>Appointment Date</th>
                                    <th>Appointment Time</th>
                                    <th>Remarks</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
                                    if (appointments != null && !appointments.isEmpty()) {
                                        SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm a");
                                        for (Appointment appointment : appointments) {
                                %>
                                <tr id="appointment-<%= appointment.getAppId() %>">
                                    <td><%= appointment.getAppId() %></td>
                                    <td><%= appointment.getPetName() %></td>
                                    <td><%= appointment.getServiceName() %></td>
                                    <td><%= appointment.getAppDate() %></td>
                                    <td><%= timeFormat.format(appointment.getAppTime()) %></td>
                                    <td><%= appointment.getAppRemark() != null ? appointment.getAppRemark() : "None" %></td>
                                    <td id="status-<%= appointment.getAppId() %>"><%= appointment.getStatus() %></td>
                                    <td id="actions-<%= appointment.getAppId() %>">
                                        <button type="button" class="btn-view" 
                                            onclick="window.location.href='AppointmentController?action=staffAdminViewAppointmentDetails&appId=<%= appointment.getAppId() %>'">
                                            View
                                        </button>
                                        <button type="button" class="btn-update" 
                                            onclick="window.location.href='AppointmentController?action=showUpdateAppointmentPage&appId=<%= appointment.getAppId() %>'">
                                            Update
                                        </button>
                                    </td>
                                </tr>
                                <%
                                        }
                                    } else {
                                %>
                                <tr>
                                    <td colspan="8" style="text-align: center;">No Approved Appointments Found</td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
        </div>
    </header>

    <footer class="footer">
        <div class="main_container footer_container">
            <div class="footer_item">
                <img src="images/nikkospacelogo.png" alt=""
                    style="max-width: 35%; height: auto; margin: 0 45%; display: block;">
                <div class="footer_p">Your Pets are Our Priority</div>
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
                <p class="footer_copy">Copyright NikkoSpace 2024. All rights
                    reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>
