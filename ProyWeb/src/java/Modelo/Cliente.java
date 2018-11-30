
package Modelo;


public class Cliente {
    int id_cliene;
    String razon_social;
    String tip_doc;
    String num_doc;
    String email;

    public Cliente() {
    }

    public Cliente(String razon_social, String tip_doc, String num_doc, String email) {
        this.razon_social = razon_social;
        this.tip_doc = tip_doc;
        this.num_doc = num_doc;
        this.email = email;
    }

    public int getId_cliene() {
        return id_cliene;
    }

    public void setId_cliene(int id_cliene) {
        this.id_cliene = id_cliene;
    }

    public String getRazon_social() {
        return razon_social;
    }

    public void setRazon_social(String razon_social) {
        this.razon_social = razon_social;
    }

    public String getTip_doc() {
        return tip_doc;
    }

    public void setTip_doc(String tip_doc) {
        this.tip_doc = tip_doc;
    }

    public String getNum_doc() {
        return num_doc;
    }

    public void setNum_doc(String num_doc) {
        this.num_doc = num_doc;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
