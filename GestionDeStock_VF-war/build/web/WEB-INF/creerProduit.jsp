<%-- 
    Document   : creerProduit
    Created on : 13 juin 2021, 02:39:46
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" type="text/css" href="css/marqueProdStyle.css">
	<title>Ajouter produit</title>
</head>
<body>

	<%@include file="navbar.jsp" %>

	<div class="container content-box">

		<form action="CreerProduit" method="POST">
		  <div class="form-row">
		    <div class="form-group col-md-6">
		      <label for="refProd">Référence du produit</label>
                      <input type="text" class="form-control" name="refProduit" id="refProd" placeholder="Reference du produit" required>
		    </div>
		    <div class="form-group col-md-6">
		      <label for="marque">Marque</label>
                      <select id="marque" name="marque" class="form-control" required>
		        <option selected disabled="">Choose...</option>
		        <c:forEach items="${marques}" var="marque" varStatus="status">
                        <option value="${marque.marque}">${marque.marque}</option>
                        </c:forEach>
		      </select>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="denomination">Dénomination</label>
                    <input type="text" name="denomination" class="form-control" id="denomination" placeholder="Type" required>
		  </div>
		  <div class="form-row">
		    <div class="form-group col-md-4">
		      <label for="prix">Prix</label>
                      <input type="number" name="prix" class="form-control" id="prix" required>
		    </div>
		    <div class="form-group col-md-4">
		      <label for="poids">Poids</label>
                      <input type="number" name="poids" class="form-control" id="poids" required>
		    </div>
		    <div class="form-group col-md-4">
		      <label for="volume">Volume</label>
                      <input type="number" name="volume" class="form-control" id="volume" required>
		    </div>
		  </div>
		  </br>
		  </br>
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
