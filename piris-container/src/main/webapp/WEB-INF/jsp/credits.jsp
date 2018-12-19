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
                <c:forEach items="${credits}" var="credit">
                    <li>
                        <div class="collapsible-header">
                            <a>Credit contract number: &nbsp</a> ${credit.number} &nbsp|&nbsp  <c:choose>
                                                        <c:when test="${credit.isDiff()}">
                                                            Differencial
                                                        </c:when>
                                                        <c:otherwise>
                                                            Whole
                                                        </c:otherwise>
                                                        </c:choose>
                        </div>
                        <div class="collapsible-body">
                            <a>Money:&nbsp</a> ${credit.money} <c:choose>
                                             <c:when test="${credit.isDollar()}">
                                                 $
                                             </c:when>
                                             <c:otherwise>
                                                 p.
                                             </c:otherwise>
                                             </c:choose>
                        </div>
                    </li>
                </c:forEach>
            </ul>
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