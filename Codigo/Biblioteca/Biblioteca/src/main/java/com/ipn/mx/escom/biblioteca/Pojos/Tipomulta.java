package com.ipn.mx.escom.biblioteca.Pojos;
// Generated 24/05/2017 04:48:03 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Tipomulta generated by hbm2java
 */
public class Tipomulta  implements java.io.Serializable {


     private int idTipoMulta;
     private String desc;
     private Set dmultaejes = new HashSet(0);

    public Tipomulta() {
    }

	
    public Tipomulta(int idTipoMulta, String desc) {
        this.idTipoMulta = idTipoMulta;
        this.desc = desc;
    }
    public Tipomulta(int idTipoMulta, String desc, Set dmultaejes) {
       this.idTipoMulta = idTipoMulta;
       this.desc = desc;
       this.dmultaejes = dmultaejes;
    }
   
    public int getIdTipoMulta() {
        return this.idTipoMulta;
    }
    
    public void setIdTipoMulta(int idTipoMulta) {
        this.idTipoMulta = idTipoMulta;
    }
    public String getDesc() {
        return this.desc;
    }
    
    public void setDesc(String desc) {
        this.desc = desc;
    }
    public Set getDmultaejes() {
        return this.dmultaejes;
    }
    
    public void setDmultaejes(Set dmultaejes) {
        this.dmultaejes = dmultaejes;
    }




}

