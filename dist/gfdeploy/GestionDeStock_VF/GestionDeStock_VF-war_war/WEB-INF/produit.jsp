<%-- 
    Document   : produit
    Created on : 12 juin 2021, 20:29:50
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
    <title>Produit</title>
    <link href="css/marqueProdStyle.css" rel="stylesheet" />
</head>
<body>

     
    <%@include file="navbar.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-8"></div>
            <div class="col-2">
                <form methode="GET" action="">
                    <select id="marques" name="marque" onchange="this.form.submit();">
                        <option value="">----Choisir----</option>
                        <option value="tous">Tous les marques</option>
                      <c:forEach items="${marques}" var="marque" varStatus="status">
                        <option value="${marque.marque}">${marque.marque}</option>
                      </c:forEach>
                    </select>
                </form>
            </div>
            <div class="col-2">
                <form action="CreerProduit" method="GET">
                    <button type="submit" class="btn btn-success" style="width: 170px;"><i class="fas fa-plus"></i> Add</button>
                </form>
            </div>
        </div>
    </div>
    

    <div class="container">
    <!--Table-->
    <table class="table table-hover table-fixed">

      <!--Table head-->
      <thead class="thead-dark">
        <tr>
          <th>#</th>
          <th>Référence</th>
          <th>Marque</th>
          <th>Dénomination </th>
          <th>Prix</th>
          <th>Poids</th>
          <th>Volume</th>
          <th>Action</th>
        </tr>
      </thead>
      <!--Table head-->

      <!--Table body-->
      <tbody>
       <c:forEach items="${produits}" var="produit" varStatus="status">
        <tr>
          <th scope="row">${status.count}</th>
          <td>${produit.refProduit}</td>
          <td>${produit.marqueProduit.marque}</td>
          <td>${produit.denomination}</td>
          <td>${produit.prix}</td>
          <td>${produit.poids}</td>
          <td>${produit.volume}</td>
          <td>
            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modifierModal${status.count}" style="font-weight: 600;"><i class="fas fa-edit"></i> Modifier</button>
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal${status.count}" style="font-weight: 600;"><i class="far fa-trash-alt"></i> Supprimer</button>
          </td>
        </tr>
        
        <!-- Supprimer Produit -->
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
                      <span style="color: red;">Voulez-vous supprimer le produit ${produit.refProduit} ?</span>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary" data-dismiss="modal">Annuler</button>
                      <a href="SupprimerProduit?refProduit=${produit.refProduit}"><button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i> Supprimer</button></a>
                    </div>
                  </div>
                </div>
            </div>
            <!-- Modifier Produit -->
            
            <div class="modal fade" id="modifierModal${status.count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Modifier le produit</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form action="ModifierProduit" methode="GET">
                        <div class="modal-body">
                                
                            <div class="container content-box">
                                  <div class="form-row">
                                    <div class="form-group col-md-6">
                                      <label for="refProd">Référence du produit</label>
                                      <input type="text" class="form-control" name="refProduit" value="${produit.refProduit}" id="refProd" placeholder="Reference du produit" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                      <label for="marque">Marque</label>
                                      <select id="marque" name="marque" class="form-control" required>
                                        <option disabled="">Choose...</option>
                                        <c:forEach items="${marques}" var="marque" varStatus="status">
                                        <option ${produit.marqueProduit.marque == marque.marque ? "selected" : ""} value="${marque.marque}">${marque.marque}</option>
                                        </c:forEach>
                                      </select>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="denomination">Dénomination</label>
                                    <input type="text" name="denomination" value="${produit.denomination}" class="form-control" id="denomination" placeholder="Type" required>
                                  </div>
                                  <div class="form-row">
                                    <div class="form-group col-md-4">
                                      <label for="prix">Prix</label>
                                      <input type="number" name="prix" value="${produit.prix}" class="form-control" id="prix" required>
                                    </div>
                                    <div class="form-group col-md-4">
                                      <label for="poids">Poids</label>
                                      <input type="number" name="poids" value="${produit.poids}" class="form-control" id="poids" required>
                                    </div>
                                    <div class="form-group col-md-4">
                                      <label for="volume">Volume</label>
                                      <input type="number" name="volume" value="${produit.volume}" class="form-control" id="volume" required>
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
