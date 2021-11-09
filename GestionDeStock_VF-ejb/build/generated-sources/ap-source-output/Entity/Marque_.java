package Entity;

import Entity.Produit;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-06-14T00:40:46")
@StaticMetamodel(Marque.class)
public class Marque_ { 

    public static volatile SingularAttribute<Marque, String> origine;
    public static volatile ListAttribute<Marque, Produit> listeProduits;
    public static volatile SingularAttribute<Marque, String> marque;

}