package Entity;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class Produit implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    private String refProduit;
    @ManyToOne
    public Marque marqueProduit;
    private String denomination; 
    private float prix;
    private float poids; 
    private float volume;

    public Produit() {
    }

    public Produit(String refProduit, Marque marqueProduit, String denomination, float prix, float poids, float volume) {
        this.refProduit = refProduit;
        this.marqueProduit = marqueProduit;
        this.denomination = denomination;
        this.prix = prix;
        this.poids = poids;
        this.volume = volume;
    }

    public String getRefProduit() {
        return refProduit;
    }

    public void setRefProduit(String refProduit) {
        this.refProduit = refProduit;
    }

    public Marque getMarqueProduit() {
        return marqueProduit;
    }

    public void setMarqueProduit(Marque marqueProduit) {
        this.marqueProduit = marqueProduit;
    }

    public String getDenomination() {
        return denomination;
    }

    public void setDenomination(String denomination) {
        this.denomination = denomination;
    }

    public float getPrix() {
        return prix;
    }

    public void setPrix(float prix) {
        this.prix = prix;
    }

    public float getPoids() {
        return poids;
    }

    public void setPoids(float poids) {
        this.poids = poids;
    }

    public float getVolume() {
        return volume;
    }

    public void setVolume(float volume) {
        this.volume = volume;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Produit other = (Produit) obj;
        if (Float.floatToIntBits(this.prix) != Float.floatToIntBits(other.prix)) {
            return false;
        }
        if (Float.floatToIntBits(this.poids) != Float.floatToIntBits(other.poids)) {
            return false;
        }
        if (Float.floatToIntBits(this.volume) != Float.floatToIntBits(other.volume)) {
            return false;
        }
        if (!Objects.equals(this.refProduit, other.refProduit)) {
            return false;
        }
        if (!Objects.equals(this.denomination, other.denomination)) {
            return false;
        }
        if (!Objects.equals(this.marqueProduit, other.marqueProduit)) {
            return false;
        }
        return true;
    }
    
}
