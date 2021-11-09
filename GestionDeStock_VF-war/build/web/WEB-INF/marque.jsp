<%-- 
    Document   : marque
    Created on : 11 juin 2021, 22:45:15
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <title>Marque</title>
    <link href="css/marqueProdStyle.css" rel="stylesheet" />
</head>
<body>


    <%@include file="navbar.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-10"></div>
            <div class="col-2">
                
                <a href="CreerMarque"><button type="button" class="btn btn-success" style="width: 170px;"><i class="fas fa-plus"></i> Add</button></a>

            </div>
        </div>
    </div>

    <div class="container">
    <!--Table-->
    <table class="table table-hover">

      <!--Table head-->
      <thead class="thead-dark">
        <tr>
          <th>#</th>
          <th>Marque</th>
          <th>Origine de fabrication</th>
          <!--<th>Liste des produits</th>-->
          <th>Action</th>
        </tr>
      </thead>
      <!--Table head-->

      <!--Table body-->
      <tbody>
          
          <c:forEach items="${marques}" var="marque" varStatus="status">
            <tr>
                <th scope="row">${status.count}</th>
                <td>${marque.marque}</td>
                <td>${marque.origine}</td>
                <!--<td>--</td>-->
                <td>
                  <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modifierModal${status.count}" style="font-weight: 600;"><i class="fas fa-edit"></i> Modifier</button>
                  <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal${status.count}" style="font-weight: 600;"><i class="far fa-trash-alt"></i> Supprimer</button>
                </td>
            </tr>
            <!-- Supprimer Marque -->
            <div class="modal fade" id="deleteModal${status.count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Supprimer</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <span style="color: red;">Voulez-vous supprimer la marque ${marque.marque} ?</span>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary" data-dismiss="modal">Annuler</button>
                      <a href="SupprimerMarque?nom=${marque.marque}"><button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i> Supprimer</button></a>
                    </div>
                  </div>
                </div>
            </div>
            <!-- Modifier Marque -->
            
            <div class="modal fade" id="modifierModal${status.count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Modifier la marque</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form action="ModifierMarque" methode="GET">
                        <div class="modal-body">
                                
                            <div class="container content-box">
                                <div class="form-row">
                                  <div class="form-group col-md-6">
                                    <label for="marque">Marque</label>
                                    <input type="text" name="marque" class="form-control" id="marque" value="${marque.marque}" required>
                                  </div>
                                  <div class="form-group col-md-6">
                                    <label for="origine">Origine</label>
                                    <input type="text" name="origine" class="form-control" id="origine" value="${marque.origine}" required>
                                  </div>
                                </div>
                            </div>


                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-primary" data-dismiss="modal">Annuler</button>
                          <button type="submit" class="btn btn-warning"><i class="fas fa-edit"></i> Modifier</button>
                        </div>
                    </form>
                  </div>
                </div>
            </div>
        </c:forEach>  
      </tbody>
      <!--Table body-->

    </table>
    <!--Table-->
    </div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
</body>
</html>
