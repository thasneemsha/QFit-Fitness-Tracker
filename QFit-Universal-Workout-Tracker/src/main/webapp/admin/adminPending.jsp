<%@ page import="java.util.List" %>
<%@ page import="com.qfit.models.User" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pending Approvals · Admin · QFit</title>
    <link rel="stylesheet" href="../static/css/styles.css">
</head>

<body class="qfit-body">

<div class="qfit-page-wrapper">

    <header class="qfit-header">
        <h1 class="qfit-title">Admin · Pending Approvals</h1>
    </header>

    <main class="qfit-main">
        <section class="qfit-glass-card">

            <h2>Pending Student Accounts</h2>

            <%
                List<User> pendingUsers = (List<User>) request.getAttribute("pendingUsers");
                if (pendingUsers == null || pendingUsers.isEmpty()) {
            %>
                <p>No pending registrations.</p>

            <% } else { %>

            <table class="qfit-table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>ID Front</th>
                    <th>ID Back</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody>
                <% for (User u : pendingUsers) { %>
                    <tr>
                        <td><%= u.getFullName() %></td>
                        <td><%= u.getEmail() %></td>

                        <td>
                            <img src="../uploads/<%= u.getIdFrontPath() %>" width="120">
                        </td>

                        <td>
                            <img src="../uploads/<%= u.getIdBackPath() %>" width="120">
                        </td>

                        <td>
                            <form action="../approveUser" method="post" style="display:inline;">
                                <input type="hidden" name="userId" value="<%= u.getId() %>">
                                <button class="qfit-btn qfit-btn-primary">Approve</button>
                            </form>

                            <form action="../rejectUser" method="post" style="display:inline;">
                                <input type="hidden" name="userId" value="<%= u.getId() %>">
                                <button class="qfit-btn qfit-btn-danger">Reject</button>
                            </form>
                        </td>

                    </tr>
                <% } %>
                </tbody>
            </table>

            <% } %>

        </section>
    </main>

</div>

</body>
</html>

