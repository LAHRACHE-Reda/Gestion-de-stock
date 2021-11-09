<%-- 
    Document   : creerMarque
    Created on : 11 juin 2021, 22:53:23
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" type="text/css" href="css/addMarqueProdStyle.css">
	<title>Ajouter Marque</title>
</head>
<body>

        <%@include file="navbar.jsp" %>

	<div class="container content-box">

		<form action="CreerMarque" method="POST">
		  <div class="form-row">
		    <div class="form-group col-md-6">
		      <label for="marque">Marque</label>
                      <input type="text" name="marque" class="form-control" id="marque" placeholder="Nom de la marque" required>
		    </div>
		     <div class="form-group col-md-6">
		      <label for="origine">Origine</label>
                      <input type="text" name="origine" class="form-control" id="origine" placeholder="Origine de la marque" required>
		    </div>
		  </div>
		  </br>
		  </br>
                  <p style="color: red;"><c:out value="${erreur}" default="" /></p>
		  </br>
		  <div class="row">
		  	<div class="col-md-5"></div>
		  	<button type="submit" class="btn btn-success btn-block col-md-2">Ajouter</button>
		  	<div class="col-md-5"></div>
		  </div>

		</form>

	</div>

</body>
</html>