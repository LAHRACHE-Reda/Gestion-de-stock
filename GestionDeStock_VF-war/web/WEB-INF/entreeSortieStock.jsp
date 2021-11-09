<%-- 
    Document   : entreeSortieStock
    Created on : 13 juin 2021, 19:15:32
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
    <title>Stock</title>
    <link href="css/marqueProdStyle.css" rel="stylesheet" />
</head>
<body>


    <%@include file="navbar.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-4"></div>
            <div  class="col-2">
                <form methode="GET" action="ByStock">
                    <select id="stock" name="stock" onchange="this.form.submit();">
                        <option value="">----Choisir----</option>
                      <c:forEach items="${stocks}" var="stock" varStatus="status">
                        <option value="${stock.nomStock}">${stock.nomStock}</option>
                      </c:forEach>
                    </select>
                </form>
            </div>
            <div class="col-2"></div>
            <div class="col-2">
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#ajouterModal" style="width: 170px;"><i class="fas fa-plus"></i> Ajouter </button>
            </div>
            <div class="col-2">
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#retirerModal" style="width: 170px;"><i class="fas fa-plus"></i> Retirer </button>
            </div>
        </div>
    </div>
    <!-- Ajouter Stock -->
            <div class="modal fade" id="ajouterModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Ajouter des produits au stock</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                      <form action="EntreeStock" method="POST">
                        <div class="modal-body">
                                
                            <div class="container content-box">
                                <div class="form-row">
                                  <div class="form-group col-md-6">
                                    <label for="nomStock">Nom du stock</label>
                                    <select id="stock" name="nomStock" class="form-control" required>
                                        <option selected disabled="">Choose...</option>
                                      <c:forEach items="${stocks}" var="stock" varStatus="status">
                                        <option value="${stock.nomStock}">${stock.nomStock}</option>
                                      </c:forEach>
                                    </select>
                                    <label for="refProduit">Réference du produit</label>
                                    <select id="refProduit" name="refProduit" class="form-control" required>
                                        <option selected disabled="">Choose...</option>
                                      <c:forEach items="${produits}" var="produit" varStatus="status">
                                        <option value="${produit.refProduit}">${produit.refProduit}</option>
                                      </c:forEach>
                                    </select>
                                    <label for="quantite">Quantité</label>
                                    <input type="number" name="quantite" class="form-control" id="qte" required>
                                  </div>
                                  
                                </div>
                            </div>


                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-primary" data-dismiss="modal">Annuler</button>
                          <button type="submit" class="btn btn-success"><i class="fas fa-add"></i> Ajouter</button>
                        </div>
                    </form>
                  </div>
                </div>
            </div>
    
    <!-- Retirer Stock -->
            <div class="modal fade" id="retirerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Retirer des produits du stock</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                      <form action="SortieStock" method="POST">
                        <div class="modal-body">
                                
                            <div class="container content-box">
                                <div class="form-row">
                                  <div class="form-group col-md-6">
                                    <label for="nomStock">Nom du stock</label>
                                    <select id="stock" name="nomStock" class="form-control" required>
                                        <option selected disabled="">Choose...</option>
                                      <c:forEach items="${stocks}" var="stock" varStatus="status">
                                        <option value="${stock.nomStock}">${stock.nomStock}</option>
                                      </c:forEach>
                                    </select>
                                    <label for="refProduit">Réference du produit</label>
                                    <select id="refProduit" name="refProduit" class="form-control" required>
                                        <option selected disabled="">Choose...</option>
                                      <c:forEach items="${produits}" var="produit" varStatus="status">
                                        <option value="${produit.refProduit}">${produit.refProduit}</option>
                                      </c:forEach>
                                    </select>
                                    <label for="quantite">Quantité</label>
                                    <input type="number" name="quantite" class="form-control" id="qte" required>
                                  </div>
                                  
                                </div>
                            </div>


                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-primary" data-dismiss="modal">Annuler</button>
                          <button type="submit" class="btn btn-success"><i class="fas fa-add"></i> Retirer</button>
                        </div>
                    </form>
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
          <th>Nom du Stock</th>
          <th>Ref du produit</th>
          <th>quantité</th>
        </tr>
      </thead>
      <!--Table head-->

      <!--Table body-->
      <tbody>
          
          <c:forEach items="${listByStock}" var="itemList" varStatus="status">
            <tr>
                <th scope="row">${status.count}</th>
                <td>${monStock}</td>
                <td>${itemList.refProduit}</td>
                <td>${itemList.quantite}</td>
            </tr>
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