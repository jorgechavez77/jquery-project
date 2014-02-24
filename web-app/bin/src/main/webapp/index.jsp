<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- <script type="text/javascript" src="jquery-1.11.0.js"></script> -->
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#newButton').click(function() {
			sendData();
		});
	});
	function sendData() {
		var mge = $('#newText').val();
		alert(mge);
		$.ajax({
			type : "POST",
			url : "ajaxServlet",
			data : {
				message : mge
			}
		}).done(function(msg) {
			alert("Data Saved: " + msg);
		});
	}
	setInterval("alert('OK')", 5000);
</script>

</head>
<body>

	<div>
		<input type="text" id="newText">
		<input type="button" id="newButton" value="sendData">
	</div>

</body>
</html>