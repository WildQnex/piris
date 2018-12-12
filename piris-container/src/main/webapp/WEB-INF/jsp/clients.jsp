<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>

    <!-- Access the bootstrap Css like this,
        Spring boot will handle the resource mapping automcatically -->
    <link href="<c:url value="../../css/materialize.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="<c:url value="../../css/app-style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="<c:url value="../../css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>

</head>
<body>

<div class="container">

<ul class="collapsible popout" data-collapsible="accordion">
                <c:forEach items="${clients}" var="client">
                    <li>
                        <div class="collapsible-header">
                            ${client.id}</a> | ${client.name} | ${client.surname}
                        </div>
                        <div class="collapsible-body">
                            <div class="row"><strong>Mobile Phone: </strong> ${client.mobilePhone} </div>
                             <form style="text-align: center" method="GET" action="/api/clients/delete">
                                <input type="hidden" name="id" value="${client.id}"/>
                                <a href="/api/clients/${client.id}" class="waves-effect waves-light btn">Edit</a>
                                <button type="submit" class="waves-effect waves-light btn delete">Delete</button>
                            </form>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        <div style="text-align: center">
                <div class="row">&nbsp</div>
                <a href="/api/clients/add" class="waves-effect waves-light btn">Create User</a>
        </div>
</div>

<script src="<c:url value="../../js/jquery-2.1.1.min.js" />"></script>
<script src="<c:url value="../../js/materialize.js" />"></script>
<script src="<c:url value="../../js/init.js" />"></script>

</body>

<script>
    $(document).ready(function() {
        $('.delete').click(function() {
            if (confirm('Do you really want to delete user?')) {
                return true;
            } else {
                return false;
            }
        });
    });

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
        format: "yyyy-mm-dd",
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15, // Creates a dropdown of 15 years to control year,
        today: 'Today',
        clear: 'Clear',
        close: 'Ok',
        closeOnSelect: false // Close upon selecting a date,
    });
</script>

</html>