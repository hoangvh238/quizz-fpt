<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" type="text/css" href="Style/profilecss.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <%@ include file="/includes/header.jsp" %>
        <section>
            <div class="view">
                <%@ include file="/includes/sidebar.jsp" %>
                <div class="body">
                    <div class="container">
                        <div class="form-header">
                            <h1 class="title">Edit Profile</h1>
                            <div class="avatar"></div>
                        </div>
                        <form style="margin-bottom: 40px;" action="updateInfo" method="post" class="form-group">
                            <div class="form-group">
                                <label class="label" for="full-name">Full Name:</label>
                                <input class="input" type="text" id="full-name" value="${user.fullname}" name="fullname">
                            </div>
                            <div class="form-group">
                                <label class="label" for="user-name">User Name:</label>
                                <input class="input" type="text" id="user-name" name="user-name" value="${user.username}">
                            </div>
                            <div class="form-group">
                                <label class="label" for="email">Email:</label>
                                <input class="input" type="email" id="email" name="email" value="${user.email}">
                            </div>
                            <div class="form-group">
                                <label class="label" for="contact-number">Contact Number:</label>
                                <input class="input" type="tel"  value="${user.contactnumber}" id="contact-number" name="contactnumber">
                            </div>
                            <div class="button-group">
                                <button class="button" type="submit">Save</button>
                            </div>
                        </form>
                        <div class="form-header">
                            <h1 class="title">Change Password</h1>
                        </div>
                        <form action="changepass"  method="post">
                            <div class="form-group">
                                <div class="password-table">
                                    <div class="table">
                                        <label class="label" for="old-password">Old Password:</label>
                                        <input class="password-input" type="password" id="oldpassword" name="oldpassword">
                                    </div>
                                    <div class="table">
                                        <label class="label" for="new-password">New Password:</label>
                                        <input class="password-input" type="password" id="newpassword" name="newpassword">
                                    </div>
                                </div>
                            </div>
                            <div class="button-group">
                                <input  class="button" type="submit" value="Change Password"></input>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

    </body>
    <script>
        window.onload = function () {
            var status = '${status}';
            var title = '${title}';
            var message = '${message}';

            if (status && title && message) {
                Swal.fire({
                    icon: status,
                    title: title,
                    text: message
                });
            }
        };
    </script>
</html>