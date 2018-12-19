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
    <div class="row">&nbsp</div>
    <div class="row">&nbsp</div>
    <div class="row">&nbsp</div>
    <form class="col s12" method="POST" action="/api/bank/credit/add" modelAttribute="CreditContract">

    <div class="row">
            <div class="input-field col s4 offset-s4">
                <select id="diff" name="diff" required>
                    <option value="" disabled>Type</option>
                    <option value="true">Separate payments</option>
                    <option value="false">One payment</option>
                </select>
                <label for="diff">Type</label>
            </div>
            <div class="row">
                        <div class="input-field col s4 offset-s4">
                            <select id="currency" name="diff" required>
                                <option value="" disabled>Currency</option>
                                <option value="false">Belarussian ruble </option>
                                <option value="true">Dollar</option>
                            </select>
                            <label for="pensioner">Currency</label>
                        </div>
            </div>
            <div class="row">
            <div class="input-field col m4 offset-m4">
                  <input id="startDate" type="text" name="startDate" class="datepicker" required

                         title="Start Date">
                  <label for="birthday">Start Date</label>
            </div>
            </div>
            <div class="row">
            <div class="input-field col m4 offset-m4">
                  <input id="endDate" type="text" name="endDate" class="datepicker" required

                         title="End Date">
                  <label for="birthday">End Date</label>
            </div>
            </div>
            <div class="row">
            <div class="input-field col m4 offset-m4">
                <input id="percent" type="text" name="percent" class="validate" required
                       pattern="[0-9]{1,2}"
                       title="Percent should be from 0 to 99">
                <label for="percent">Percent</label>
            </div>
            </div>
            <div class="row">
            <div class="input-field col m4 offset-m4">
                <input id="money" type="text" name="money" class="validate" required
                       pattern="[0-9]{1,9}">
                <label for="money">Money</label>
            </div>
            </div>
            <div class="row">
            <div class="input-field col m4 offset-m4">
                <input id="id" type="text" name="id" class="validate" required
                       pattern="[0-9]{1,9}">
                <label for="money">User Id</label>
            </div>
            </div>
    </div>
    <div class="row">
                <button class="col s6 m2 offset-s3 offset-m5 btn amber accent-4 amber accent-4 waves-effect waves-light center"
                        type="submit">
                    Create
                </button>
            </div>
        </form>
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