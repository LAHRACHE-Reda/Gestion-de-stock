<%-- 
    Document   : navbar
    Created on : 11 juin 2021, 22:29:00
    Author     : HP
--%>

<nav class="navbar navbar-light navbar-expand-lg" style="background-color: #e3f2fd; margin-bottom: 50px;">

    <a class="navbar-brand" href="Accueil"><img src="img/ehtp.png" style="height: 40px; margin-right: 40px;"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav mr-auto" style="font-weight: 600;">

      	<li class="nav-item" style="margin-right: 8px;">
          <a class="nav-link" href="Accueil">Accueil</a>
        </li>
        <li class="nav-item" style="margin-right: 8px;">
          <a class="nav-link" href="Marque">Marque</a>
        </li>
        <li class="nav-item" style="margin-right: 8px;">
          <a class="nav-link" href="Produit">Produit</a>
        </li>
        <li class="nav-item" style="margin-right: 8px;">
          <a class="nav-link" href="Stock">Stock</a>
        </li>
        <li class="nav-item" style="margin-right: 8px;">
          <a class="nav-link" href="EntreeSortieStock">Entrée/Sortie du stock</a>
        </li>

      </ul>

        <form class="form-inline" method="POST" action="Accueil">
        <!-- <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"> -->
        <button style="font-weight: 600;" class="btn btn-outline-info my-2 my-sm-0" type="submit"><i class="fas fa-power-off"></i> Logout</button>
      </form>
    </div>

  </nav>