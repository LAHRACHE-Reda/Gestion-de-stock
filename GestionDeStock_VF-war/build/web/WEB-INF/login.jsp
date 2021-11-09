<%-- 
    Document   : login
    Created on : 11 juin 2021, 16:57:26
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <title>Login</title>
</head>
<body>
    
<div class="container-fluid logo">
    <div class="row">
        <div class="col-md-1"><img class="mx-auto d-block" src="img/ehtp.png" alt="" height="60px"></div>
        <div class="col-md-11"></div>
    </div>
</div>
<div class="container content-box">
    <div class="row">
        <div class="col-sm-6">
            <img class="img-fluid" src="img/cnx.svg" alt="image" width="350px">
        </div>
        <div class="col-sm-6">
            <form action="Login" method="POST">
            <div class="form-group">
                <label for="user"><img class="img-fluid" src="img/user.svg" alt="image" width="20px"> Username</label>
                <input type="text" class="form-control" name="username" id="user" aria-describedby="textHelpId" required>
                <label for="pass"><img class="img-fluid" src="img/lock.svg" alt="image" width="20px"> Password</label>
                <input type="password" class="form-control" name="password" id="pass" aria-describedby="passwordHelpId" required>
            </div>
            <input class="btn" type="submit" value="Connexion" />
            </form>
            <span style="color: red;" position: relative;><c:out value="${login}" default="" /></span>
        </div>
    </div>
</div>

</body>
</html>