package Entity;

import Entity.Marque;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-06-14T00:40:46")
@StaticMetamodel(Produit.class)
public class Produit_ { 

    public static volatile SingularAttribute<Produit, Float> volume;
    public static volatile SingularAttribute<Produit, String> refProduit;
    public static volatile SingularAttribute<Produit, Float> prix;
    public static volatile SingularAttribute<Produit, Float> poids;
    public static volatile SingularAttribute<Produit, Marque> marqueProduit;
    public static volatile SingularAttribute<Produit, String> denomination;

}