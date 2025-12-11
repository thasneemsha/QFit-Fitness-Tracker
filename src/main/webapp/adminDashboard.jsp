<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Admin object (AdminUser) is expected to be stored in the session by the LoginServlet --%>
<c:set var="admin" value="${sessionScope.currentAdmin}" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel · QFit Fitness Tracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/css/styles.css">
    <%-- Assuming the admin panel uses dashboard styles for grid and card layout --%>
    <link rel="stylesheet" href="static/css/dashboard.css">
</head>
<body class="qfit-body qfit-dashboard-body">


<div class="qfit-page-wrapper">
    <div class="qfit-bg-gradient"></div>


    <header class="qfit-nav">
        <div class="qfit-logo-group">
            <h1 class="qfit-title">QFit Admin Panel</h1>
        </div>
        <nav class="qfit-nav-actions">
            <a href="LogoutServlet" class="qfit-btn qfit-btn-secondary qfit-logout-btn">
                Log Out
            </a>
        </nav>
    </header>




    <main class="qfit-dashboard-main qfit-admin-main">
        <div class="qfit-admin-card qfit-glass-card">
           
            <div class="qfit-admin-header-row">
                <div>
                    <h2 class="qfit-admin-heading">Welcome back, <c:out value="${admin.fullName}" default="Admin"/>!</h2>
                    <p class="qfit-admin-subtext">Quick overview of user activity and pending tasks.</p>
                </div>
                <span class="qfit-admin-tag">
                    <span class="qfit-admin-dot"></span> Administrator
                </span>
            </div>


            <div class="qfit-admin-summary">
                <div class="qfit-admin-summary-item qfit-summary-pending">
                    <p class="qfit-admin-summary-label">Pending Verification</p>
                    <p class="qfit-admin-summary-value" id="pendingCountValue"><c:out value="${requestScope.pendingCount}" default="0"/></p>
                    <p class="qfit-admin-summary-note">Needs immediate review</p>
                </div>
               
                <div class="qfit-admin-summary-item qfit-summary-active">
                    <p class="qfit-admin-summary-label">Active Students</p>
                    <p class="qfit-admin-summary-value"><c:out value="${requestScope.activeCount}" default="0"/></p>
                    <p class="qfit-admin-summary-note">Verified & Engaged</p>
                </div>


                <div class="qfit-admin-summary-item qfit-summary-total">
                    <p class="qfit-admin-summary-label">Total Users</p>
                    <p class="qfit-admin-summary-value"><c:out value="${requestScope.totalCount}" default="0"/></p>
                    <p class="qfit-admin-summary-note">All Registered Accounts</p>
                </div>
            </div>




            <div class="qfit-admin-section">
                <h3>Quick Actions</h3>
                <div class="qfit-quick-actions">
                    <button class="qfit-btn qfit-btn-primary qfit-quick-action-btn" id="reviewPendingBtn">
                        Review Pending (<c:out value="${requestScope.pendingCount}" default="0"/>)
                    </button>
                    <button class="qfit-btn qfit-btn-secondary qfit-quick-action-btn" id="viewAllStudentsBtn">
                        View All Students
                    </button>
                </div>
            </div>




            <div class="qfit-admin-section qfit-admin-pending-list" id="pendingListSection">
                <h3 class="qfit-section-title-pending">Awaiting Verification Cards (<c:out value="${requestScope.pendingCount}" default="0"/>)</h3>
               
                <div class="qfit-user-list-grid">
                    <c:forEach var="user" items="${requestScope.pendingUsers}">
                        <div class="qfit-user-card qfit-card-pending" data-user-id="${user.id}">
                            <div class="qfit-user-info">
                                <h4><c:out value="${user.fullName}"/></h4>
                                <p>@<c:out value="${user.username}"/> | <span class="qfit-status-badge qfit-status-pending">PENDING</span></p>
                            </div>
                            <div class="qfit-user-actions">
                                <button class="qfit-btn qfit-btn-sm qfit-btn-primary qfit-view-btn"
                                        data-user-id="${user.id}"
                                        data-full-name="<c:out value="${user.fullName}"/>"
                                        data-upload-date="<c:out value="${user.submissionDate}"/>">
                                    View
                                </button>
                                <button class="qfit-btn qfit-btn-sm qfit-btn-deactivate" data-user-id="${user.id}">Deactivate</button>
                            </div>
                        </div>
                    </c:forEach>
                   
                    <c:if test="${empty requestScope.pendingUsers}">
                        <p class="qfit-note">🎉 No pending verifications found. Good job!</p>
                    </c:if>
                </div>
            </div>




            <div class="qfit-admin-section qfit-admin-all-users-list" id="allUsersSection" style="display: none;">
                <h3 class="qfit-section-title-all">All Platform Users (<c:out value="${requestScope.totalCount}" default="0"/>)</h3>


                <div class="qfit-user-list-grid">
                    <c:forEach var="user" items="${requestScope.allUsers}">
                        <%-- Determine CSS class and display text based on status --%>
                        <c:choose>
                            <c:when test="${user.verificationStatus eq 'APPROVED'}">
                                <c:set var="statusClass" value="approved"/>
                                <c:set var="statusText" value="APPROVED"/>
                            </c:when>
                            <c:when test="${user.verificationStatus eq 'REJECTED'}">
                                <c:set var="statusClass" value="declined"/>
                                <c:set var="statusText" value="REJECTED"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="statusClass" value="pending"/>
                                <c:set var="statusText" value="PENDING"/>
                            </c:otherwise>
                        </c:choose>
                       
                        <div class="qfit-user-card qfit-card-${statusClass}" data-user-id="${user.id}">
                            <div class="qfit-user-info">
                                <h4><c:out value="${user.fullName}"/></h4>
                                <p>@<c:out value="${user.username}"/> | <span class="qfit-status-badge qfit-status-${statusClass}"><c:out value="${statusText}"/></span></p>
                            </div>
                            <div class="qfit-user-actions">
                                <%-- If status is PENDING, show View button --%>
                                <c:if test="${user.verificationStatus eq 'PENDING'}">
                                    <button class="qfit-btn qfit-btn-sm qfit-btn-primary qfit-view-btn"
                                            data-user-id="${user.id}"
                                            data-full-name="<c:out value="${user.fullName}"/>"
                                            data-upload-date="<c:out value="${user.submissionDate}"/>">
                                        View
                                    </button>
                                </c:if>
                                <button class="qfit-btn qfit-btn-sm qfit-btn-deactivate" data-user-id="${user.id}">Deactivate</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>




        </div>
    </main>




    <footer class="qfit-footer">
        QFit Fitness Tracker Admin &copy; 2025
    </footer>
</div>


<div class="qfit-modal" id="verificationModal">
    <div class="qfit-modal-content qfit-glass-card qfit-verification-modal-content">
        <span class="qfit-close-btn">&times;</span>
        <h3 class="qfit-modal-header">Review Verification Card for <span id="modalUserName"></span></h3>
       
        <form id="verificationForm" action="AdminActionServlet" method="post">
            <input type="hidden" name="actionType" id="actionType" value="">
            <input type="hidden" name="userId" id="modalSubmitUserId" value="">
       
            <div class="qfit-verification-document-area">
                <p><strong>Submitted Document/ID:</strong> </p>
                <p>Verification data for <strong id="modalUserId">User ID X</strong>. Upload Date: <span id="modalUploadDate"></span></p>
                <div class="qfit-document-image-placeholder">
                   
                </div>
            </div>




            <div class="qfit-modal-actions-container">
                <button type="button" class="qfit-btn qfit-btn-primary qfit-verification-action-btn" id="verifyBtn">
                    Verify User
                </button>
                <button type="button" class="qfit-btn qfit-btn-sm qfit-btn-decline-action" id="rejectBtn">
                    Reject Card
                </button>
            </div>
        </form>
    </div>
</div>




<script>
    // --- JavaScript for Dynamic Interaction ---


    // Get elements
    const pendingListSection = document.getElementById('pendingListSection');
    const allUsersSection = document.getElementById('allUsersSection');
    const reviewPendingBtn = document.getElementById('reviewPendingBtn');
    const viewAllStudentsBtn = document.getElementById('viewAllStudentsBtn');
    const modal = document.getElementById('verificationModal');
    const closeBtn = modal.querySelector('.qfit-close-btn');
    const verificationForm = document.getElementById('verificationForm');


    // Show/Hide Sections
    reviewPendingBtn.addEventListener('click', () => {
        pendingListSection.style.display = 'grid'; // Changed to 'grid' to match typical list layout
        allUsersSection.style.display = 'none';
    });


    viewAllStudentsBtn.addEventListener('click', () => {
        pendingListSection.style.display = 'none';
        allUsersSection.style.display = 'grid'; // Changed to 'grid'
    });


    // Modal functionality (Pop-up)
    document.querySelectorAll('.qfit-view-btn').forEach(button => {
        button.addEventListener('click', (e) => {
            const userId = e.target.getAttribute('data-user-id');
            const userName = e.target.getAttribute('data-full-name');
            const uploadDate = e.target.getAttribute('data-upload-date');
           
            // Set modal content
            document.getElementById('modalUserName').textContent = userName;
            document.getElementById('modalUserId').textContent = `User ID ${userId}`;
            document.getElementById('modalUploadDate').textContent = uploadDate;
            document.getElementById('modalSubmitUserId').value = userId; // Set hidden form field
           
            // TODO: AJAX call here to fetch the ID card image URL for display
           
            // Show modal
            modal.style.display = 'flex';
        });
    });


    closeBtn.onclick = function() {
        modal.style.display = "none";
    }


    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
   
    // Verification/Rejection AJAX Handlers
    document.getElementById('verifyBtn').addEventListener('click', () => {
        document.getElementById('actionType').value = 'VERIFY';
        verificationForm.submit();
    });


    document.getElementById('rejectBtn').addEventListener('click', () => {
        document.getElementById('actionType').value = 'REJECT';
        verificationForm.submit();
    });
   
    // Deactivate Button - Requires separate AJAX handler
    document.querySelectorAll('.qfit-btn-deactivate').forEach(btn => {
        btn.addEventListener('click', (e) => {
            if (confirm("Are you sure you want to deactivate this user account?")) {
                const userId = e.target.getAttribute('data-user-id');
                // TODO: Implement AJAX call to AdminActionServlet with action=DEACTIVATE
                console.log(`Deactivating User ID: ${userId}`);
            }
        });
    });


</script>


</body>
</html>

