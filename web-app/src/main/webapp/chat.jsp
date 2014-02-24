<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	System.out.println("Validating user");
	if (request.getSession().getAttribute("user") == null) {
		request.getRequestDispatcher("index.jsp").forward(request,
				response);
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Apache Tomcat WebSocket Examples: Chat</title>
<style type="text/css">
input#chat {
	width: 410px
}

#console-container {
	width: 400px;
}

#console {
	border: 1px solid #CCCCCC;
	border-right-color: #999999;
	border-bottom-color: #999999;
	height: 170px;
	overflow-y: scroll;
	padding: 5px;
	width: 100%;
}

#console p {
	padding: 0;
	margin: 0;
}
</style>
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#newButton').click(function() {
			sendData();
		});
	});

	
	
	function sendMessage() {
		var mge = $('#newText').val();
		console.log(mge);
		$.ajax({
			type : "POST",
			url : "ajaxServlet",
			data : {
				message : mge
			}
		}).done(function(msg) {
			console.log("Data Saved: " + msg);
		});
	}

	function getMessage() {
		var mge = $('#newText').val();
		console.log(mge);
		$.ajax({
			type : "POST",
			url : "ajaxServlet",
			data : {
				message : mge
			}
		}).done(function(msg) {
			console.log("Data Saved: " + msg);
		});
	}
	
	setInterval("getMessage()", 10000);

	function initChat() {
		var userId = $('#userId').val();
		$.ajax({
			type : "POST",
			url : "ajaxServlet",
			data : {
				message : userId
			}
		}).done(function(msg) {
			console.log("Logued: " + msg);
		});
	}

</script>
</head>
<!-- <body onload="load()"> -->
<body>
	<input id="userId" type="hidden" value="${user}">
	<table>
		<tr>
			<td>${user}
				<div>
					<p>
						<input type="text" placeholder="type and press enter to chat"
							id="chat" />
					</p>
					<div id="console-container">
						<div id="console" />
					</div>
				</div>
				<form action="login" method="post">
					<input type="hidden" name="action" value="logout"> <input
						value="Logout" type="submit" />
				</form>
			</td>
			<c:if test="${user.type eq 'H'}">
				<td>
					<table>
						<tr>
							<td>
								<button id="presentation" onclick="sendMyMessage()">Presentacion</button>
							</td>
						</tr>
						<tr>
							<td>
								<button>Dispositivo</button>
							</td>
						</tr>
						<tr>
							<td>
								<button>Registro Disp.</button>
							</td>
						</tr>
						<tr>
							<td>
								<button>Reg. Problema</button>
							</td>
						</tr>
						<tr>
							<td>
								<button>Ayuda</button>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table>
						<tr>
							<td><input placeholder="N° Serie"> <input
								placeholder="Codigo"> <input placeholder="Modelo">
							</td>
						</tr>
						<tr>
							<td><input placeholder="Garantia"></td>
						<tr>
							<td><select>
									<option>Problemas</option>
							</select></td>
						<tr>
							<td><select multiple="multiple" title="Soluciones">
									<option>option1</option>
							</select></td>
						</tr>
					</table>
				</td>
			</c:if>
		</tr>
	</table>
</body>
</html>
