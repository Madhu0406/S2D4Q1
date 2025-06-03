<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Spring MVC Form Demo</title></head>
<body>
<h2>Spring MVC Request Handling via Forms</h2>

<h3>Greet (GET /greet)</h3>
<form action="greet" method="get">
    Name: <input type="text" name="name" />
    <input type="submit" value="Greet" />
</form>


<h3>Submit Data (POST /submit)</h3>
<form action="submit" method="post">
    Data: <input type="text" name="data" />
    <input type="submit" value="Submit Data" />
</form>

<h3>Get JSON Response (GET /json/{id})</h3>
<form action="json" method="get" onsubmit="event.preventDefault(); fetchJson();">
    ID: <input type="number" id="jsonId" />
    <input type="submit" value="Get JSON" />
</form>
<pre id="jsonOutput"></pre>

<script>
function fetchJson() {
    const id = document.getElementById('jsonId').value;
    fetch('json/' + id)
        .then(response => response.json())
        .then(data => {
            document.getElementById('jsonOutput').textContent = JSON.stringify(data, null, 2);
        });
}
</script>

<h3>Render View with Message</h3>
<form action="view" method="get">
    <input type="submit" value="Show View" />
</form>

<c:if test="${not empty message}">
    <h3>Model Message:</h3>
    <p style="color:blue;">${message}</p>
</c:if>

</body>
</html>
