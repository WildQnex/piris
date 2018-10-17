<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>

    <!-- Access the bootstrap Css like this,
        Spring boot will handle the resource mapping automcatically -->
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="css/app-style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

</head>
<body>

<div class="container">

    <form class="col s12" name="book" action="booking" method="POST">
        <input type="hidden" name="action" value="admin_update_user_profile">
        <input type="hidden" name="id" value="${userProfile.id}">
        <div class="row">
            <div class="input-field col s4 m4">
                <input id="firstName" type="text" name="firstName" class="validate" required
                       pattern="[a-zA-Zа-яА-Я]{2,45}" value="${userProfile.firstName}"
                       title="User Name">
                <label for="firstName">User Name</label>
            </div>
            <div class="input-field col s4 m4">
                <input id="lastName" type="text" name="lastName" class="validate" required
                       pattern="[a-zA-Zа-яА-Я]{2,45}" value="${userProfile.lastName}"
                       title="Last Name">
                <label for="lastName">Last Name</label>
            </div>
            <div class="input-field col s4 m4">
                <input id="middleName" type="text" name="middleName" class="validate"
                       pattern="[a-zA-Zа-яА-Я]{0,45}" value="${userProfile.middleName}"
                       title="Middle Name">
                <label for="middleName">Middle Name</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s4 m4">
                <label for="balance">Balance</label>
                <input disabled name="balance" id="balance" type="number" value="${userProfile.balance}">
            </div>
            <div class="input-field col s4 m4">
                <input id="email" type="email" name="email" class="validate" value="${userProfile.email}"
                       disabled title="Email">
                <label for="email">Email</label>
            </div>
            <div class="input-field col s4 m4">
                <select id="role" name="role">
                    <option value="" disabled>Role</option>
                    <c:choose>
                        <c:when test="${userProfile.role.toString().equalsIgnoreCase('Admin')}">
                            <option value="user">User</option>
                            <option selected value="admin">Admin</option>
                        </c:when>
                        <c:otherwise>
                            <option selected value="user">User</option>
                            <option value="admin">Admin</option>
                        </c:otherwise>
                    </c:choose>
                </select>
                <label for="role">Role</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s4 m4">
                <input id="phoneNumber" type="text" name="phoneNumber" class="validate" maxlength="18" required
                       pattern="((\+)?\d+?-?\d+-?\d+)|((\+\d+)?(\(\d{3}\))\d{7})|
                               ((\+\d+)?(\(\d{3}\))(\(\d{3}\))?-?\d)|((\+-?(\d){3,18}))"
                       value="${userProfile.phoneNumber}" title="Phone">
                <label for="phoneNumber">Phone</label>
            </div>

            <div class="input-field col s4 m4">
                <select id="active" name="active">
                    <option value="" disabled>Activity</option>
                    <c:choose>
                        <c:when test="${userProfile.active}">
                            <option selected value="true">Active</option>
                            <option value="false">Inactive</option>
                        </c:when>
                        <c:otherwise>
                            <option value="true">Active</option>
                            <option selected value="false">Inactive</option>
                        </c:otherwise>
                    </c:choose>
                </select>
                <label for="role">Activity</label>
            </div>
        </div>
        <div class="row">
            <button class="col s6 m2 offset-s3 offset-m5 btn amber accent-4 amber accent-4 waves-effect waves-light center"
                    type="submit">
                Change
            </button>
        </div>
    </form>

    <%--<c:forEach items="${clients}" var="client">--%>
          <%--${}--%>
    <%--</c:forEach>--%>
</div>

<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/materialize.js"></script>
<script src="js/init.js"></script>

</body>

<script>
    $(document).ready(function () {
        $('select').material_select();
    });
    $(window).on("load", function () {
        if ($('#loginError').length == 1) {
            $('#modal').modal('open');
        }
    });
</script>

<script>
    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15, // Creates a dropdown of 15 years to control year,
        today: 'Today',
        clear: 'Clear',
        close: 'Ok',
        closeOnSelect: false // Close upon selecting a date,
    });
</script>

</html>