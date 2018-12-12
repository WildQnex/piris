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
    <form class="col s12" method="POST" action="/api/clients/add" modelAttribute="client">

        <input id="id" type="hidden" name="id" value="${client.id}">

        <div class="row">
            <div class="input-field col s4 m4">
                <input id="name" type="text" name="name" class="validate" required
                       pattern="[\w]{2,50}" value="${client.name}"
                       title="You should enter your name using latin or cyrilic alphabet without any spaces">
                <label for="name">First Name</label>
            </div>
            <div class="input-field col s4 m4">
                <input id="surname" type="text" name="surname" class="validate" required
                       pattern="[\w]{2,50}" value="${client.surname}"
                       title="Last Name">
                <label for="surname">Last Name</label>
            </div>
            <div class="input-field col s4 m4">
                <input id="middleName" type="text" name="middleName" class="validate" required
                       pattern="[\w]{0,50}" value="${client.middleName}"
                       title="Middle Name">
                <label for="middleName">Middle Name</label>
            </div>
        </div>

        <div class="row">

            <div class="input-field col s4 m4">
                <input id="birthday" type="text" name="birthday" class="datepicker" required
                       value="${client.birthday}"
                       title="Birthday">
                <label for="birthday">Birthday</label>
            </div>

            <div class="input-field col s4 m4">
                <input id="passportSeries" type="text" name="passportSeries" class="validate" required
                       pattern="[A-ZА-Я]{2}" value="${client.passportSeries}"
                       title="Passport Series">
                <label for="passportSeries">Passport Series</label>
            </div>
            <div class="input-field col s4 m4">
                <input id="passportNumber" type="text" name="passportNumber" class="validate" required
                       pattern="[0-9]{7}" value="${client.passportNumber}"
                       title="Passport Number">
                <label for="passportNumber">Passport Number</label>
            </div>
        </div>

        <div class="row">
            <div class="input-field col s4 m4">
                <input id="issuedBy" type="text" name="issuedBy" class="validate" required
                       pattern="[\w\s]{1,100}" value="${client.issuedBy}"
                       title="Issued By">
                <label for="issuedBy">Issued By</label>
            </div>

            <div class="input-field col s4 m4">
                <input id="issueDate" type="text" name="issueDate" class="datepicker" required
                       value="${client.issueDate}"
                       title="Issue Date">
                <label for="issueDate">Issue Date</label>
            </div>

            <div class="input-field col s4 m4">
                <input id="identNumber" type="text" name="identNumber" class="validate" required
                       pattern="[0-9]{7}[A-ZА-Я]{1}[0-9]{3}[A-ZА-Я]{2}[0-9]{1}" value="${client.identNumber}"
                       title="Ident Number">
                <label for="identNumber">Ident Number</label>
            </div>
        </div>

        <div class="row">
            <div class="input-field col s4 m4">
                <input id="birthdayPlace" type="text" name="birthdayPlace" class="validate" required
                       pattern="[\w]{2,50}" value="${client.birthdayPlace}"
                       title="Birthday Place">
                <label for="birthdayPlace">Birthday Place</label>
            </div>
            <div class="input-field col s4 m4">
                <input id="address" type="text" name="address" class="validate" required
                       pattern="[\-\,\.\w\s]{2,100}" value="${client.address}"
                       title="Address">
                <label for="address">Address</label>
            </div>
            <div class="input-field col s4 m4">
                <input id="homeTelephone" type="text" name="homeTelephone" class="validate"
                       pattern="[+]{0,1}[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*" value="${client.homeTelephone}"
                       maxlength="20"
                       title="Home Telephone">
                <label for="homeTelephone">Home Telephone</label>
            </div>
        </div>

        <div class="row">
            <div class="input-field col s4 m4">
                <input id="mobilePhone" type="text" name="mobilePhone" class="validate"
                       pattern="[+]{0,1}[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*" value="${client.mobilePhone}"
                       maxlength="20"
                       title="Mobile Phone">
                <label for="mobilePhone">Mobile Phone</label>
            </div>
            <div class="input-field col s4 m4">
                <input id="email" type="email" name="email" class="validate"
                       value="${client.email}"
                       maxlength="50"
                       title="Email">
                <label for="email">Email</label>
            </div>
            <div class="input-field col s4 m4">
                <input id="workplace" type="text" name="workplace" class="validate"
                       pattern="[\w\s]{0,50}" value="${client.workplace}"
                       title="Workplace">
                <label for="workplace">Workplace</label>
            </div>
        </div>

        <div class="row">
            <div class="input-field col s4 m4">
                <input id="position" type="text" name="position" class="validate"
                       pattern="[\w\s]{0,30}" value="${client.position}"
                       title="Position">
                <label for="position">Position</label>
            </div>

            <div class="input-field col s4 m4">
                <select id="pensioner" name="pensioner" required>
                    <option value="" disabled>Pensioner</option>
                    <c:choose>
                        <c:when test="${client.pensioner}">
                            <option selected value="true">True</option>
                            <option value="false">False</option>
                        </c:when>
                        <c:otherwise>
                            <option value="true">True</option>
                            <option selected value="false">False</option>
                        </c:otherwise>
                    </c:choose>
                </select>
                <label for="pensioner">Pensioner</label>
            </div>

            <div class="input-field col s4 m4">
                <input id="salary" type="text" name="salary" class="validate"
                       pattern="[0-9]{1,15}(\.[0-9]{1,3})?" value="${client.salary}"
                       title="Salary">
                <label for="salary">Salary</label>
            </div>
        </div>

        <div class="row">

            <div class="input-field col s4 m4">
                <select id="disability" name="disability">
                    <c:choose>
                        <c:when test="${client.disabilityDegree.id=='6'}">
                            <option selected value=6>0</option>
                        </c:when>
                        <c:otherwise>
                            <option value=6>0</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${client.disabilityDegree.id=='1'}">
                            <option selected value=1>1</option>
                        </c:when>
                        <c:otherwise>
                            <option value=1>1</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${client.disabilityDegree.id=='2'}">
                            <option selected value=2>2</option>
                        </c:when>
                        <c:otherwise>
                            <option value=2>2</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${client.disabilityDegree.id=='3'}">
                            <option selected value=3>3</option>
                        </c:when>
                        <c:otherwise>
                            <option value=3>3</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${client.disabilityDegree.id=='4'}">
                            <option selected value=4>4</option>
                        </c:when>
                        <c:otherwise>
                            <option value=4>4</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${client.disabilityDegree.id=='5'}">
                            <option selected value=5>5</option>
                        </c:when>
                        <c:otherwise>
                            <option value=5>5</option>
                        </c:otherwise>
                    </c:choose>
                </select>
                <label for="disability">Disability Degree</label>
            </div>


            <div class="input-field col s4 m4">
                <select id="militarity" name="militarity" required>
                    <option value="" disabled>Activity</option>
                    <c:choose>
                        <c:when test="${client.militarity}">
                            <option selected value="true">True</option>
                            <option value="false">False</option>
                        </c:when>
                        <c:otherwise>
                            <option value="true">True</option>
                            <option selected value="false">False</option>
                        </c:otherwise>
                    </c:choose>
                </select>
                <label for="militarity">Militarity</label>
            </div>

            <div class="input-field col s4 m4">
                <select id="meritalStatus" name="meritalStatus"  required>
                <c:choose>
                    <c:when test="${client.meritalStatus.id=='1'}">
                        <option selected value=1>Married</option>
                    </c:when>
                    <c:otherwise>
                        <option value=1>Married</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.meritalStatus.id=='2'}">
                        <option selected value=2>Widowed</option>
                    </c:when>
                    <c:otherwise>
                        <option value=2>Widowed</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.meritalStatus.id=='3'}">
                        <option selected value=3>Separated</option>
                    </c:when>
                    <c:otherwise>
                        <option value=3>Separated</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.meritalStatus.id=='4'}">
                        <option selected value=4>Divorced</option>
                    </c:when>
                    <c:otherwise>
                        <option value=4>Divorced</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.meritalStatus.id=='5'}">
                        <option selected value=5>Single</option>
                    </c:when>
                    <c:otherwise>
                        <option value=5>Single</option>
                    </c:otherwise>
                </c:choose>
                </select>
                <label for="meritalStatus">Merital Status</label>
            </div>
        </div>

        <div class="row">
            <div class="input-field col s4 m4">
                <select id="citizenship" name="citizenship" required>
                <c:choose>
                    <c:when test="${client.citizenship.id=='1'}">
                        <option selected value=1>American</option>
                    </c:when>
                    <c:otherwise>
                        <option value=1>American</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.citizenship.id=='2'}">
                        <option selected value=2>Australian</option>
                    </c:when>
                    <c:otherwise>
                        <option value=2>Australian</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.citizenship.id=='3'}">
                        <option selected value=3>Belarusian</option>
                    </c:when>
                    <c:otherwise>
                        <option value=3>Belarusian</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.citizenship.id=='4'}">
                        <option selected value=4>British</option>
                    </c:when>
                    <c:otherwise>
                        <option value=4>British</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.citizenship.id=='5'}">
                        <option selected value=5>Chinese</option>
                    </c:when>
                    <c:otherwise>
                        <option value=5>Chinese</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.citizenship.id=='6'}">
                        <option selected value=6>Dutch</option>
                    </c:when>
                    <c:otherwise>
                        <option value=6>Dutch</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.citizenship.id=='7'}">
                        <option selected value=7>Indian</option>
                    </c:when>
                    <c:otherwise>
                        <option value=7>Indian</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.citizenship.id=='8'}">
                        <option selected value=8>Japanese</option>
                    </c:when>
                    <c:otherwise>
                        <option value=8>Japanese</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.citizenship.id=='9'}">
                        <option selected value=9>Mexican</option>
                    </c:when>
                    <c:otherwise>
                        <option value=9>Mexican</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.citizenship.id=='10'}">
                        <option selected value=10>Russian</option>
                    </c:when>
                    <c:otherwise>
                        <option value=10>Russian</option>
                    </c:otherwise>
                </c:choose>
                </select>
                <label for="citizenship">Citizenship</label>
            </div>
            <div class="input-field col s4 m4">
                <select id="city" name="city" required>
                <c:choose>
                    <c:when test="${client.city.id=='1'}">
                        <option selected value=1>Brest</option>
                    </c:when>
                    <c:otherwise>
                        <option value=1>Brest</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='2'}">
                        <option selected value=2>Grodno</option>
                    </c:when>
                    <c:otherwise>
                        <option value=2>Grodno</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='3'}">
                        <option selected value=3>Gomel</option>
                    </c:when>
                    <c:otherwise>
                        <option value=3>Gomel</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='4'}">
                        <option selected value=4>Vitebsk</option>
                    </c:when>
                    <c:otherwise>
                        <option value=4>Vitebsk</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='5'}">
                        <option selected value=5>Minsk</option>
                    </c:when>
                    <c:otherwise>
                        <option value=5>Minsk</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='6'}">
                        <option selected value=6>Mogilev</option>
                    </c:when>
                    <c:otherwise>
                        <option value=6>Mogilev</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='7'}">
                        <option selected value=7>Moscow</option>
                    </c:when>
                    <c:otherwise>
                        <option value=7>Moscow</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='8'}">
                        <option selected value=8>Kiev</option>
                    </c:when>
                    <c:otherwise>
                        <option value=8>Kiev</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='9'}">
                        <option selected value=9>St.Petersburg</option>
                    </c:when>
                    <c:otherwise>
                        <option value=9>St.Petersburg</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='10'}">
                        <option selected value=10>Berlin</option>
                    </c:when>
                    <c:otherwise>
                        <option value=10>Berlin</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='11'}">
                        <option selected value=11>Begin</option>
                    </c:when>
                    <c:otherwise>
                        <option value=11>Begin</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='12'}">
                        <option selected value=12>Canberra</option>
                    </c:when>
                    <c:otherwise>
                        <option value=12>Canberra</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='13'}">
                        <option selected value=13>Tokyo</option>
                    </c:when>
                    <c:otherwise>
                        <option value=13>Tokyo</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='14'}">
                        <option selected value=14>Mexico</option>
                    </c:when>
                    <c:otherwise>
                        <option value=14>Mexico</option>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${client.city.id=='15'}">
                        <option selected value=15>Delhi</option>
                    </c:when>
                    <c:otherwise>
                        <option value=15>Delhi</option>
                    </c:otherwise>
                </c:choose>
                </select>
                <label for="city">City</label>
            </div>
        </div>
        <div class="row">
            <button class="col s6 m2 offset-s3 offset-m5 btn amber accent-4 amber accent-4 waves-effect waves-light center"
                    type="submit">
                Create
            </button>
        </div>
    </form>

    <%--<c:forEach items="${clients}" var="client">--%>
    <%--${}--%>
    <%--</c:forEach>--%>
</div>

<script src="<c:url value="../../js/jquery-2.1.1.min.js" />"></script>
<script src="<c:url value="../../js/materialize.js" />"></script>
<script src="<c:url value="../../js/init.js" />"></script>

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