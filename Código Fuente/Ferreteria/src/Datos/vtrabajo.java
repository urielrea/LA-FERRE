/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Datos;

/**
 *
 * @author CARLOS
 */
public class vtrabajo {
    private int idtrabajo;
    private String contacto;
    private String cant_empleados;
    private String descripcion;
    private String caracteristicas;
    private Double precio_diario;
    private String estado;
    private String tipo_trabajo;

    public vtrabajo(int idtrabajo, String contacto, String cant_empleados, String descripcion, String caracteristicas, Double precio_diario, String estado, String tipo_trabajo) {
        this.idtrabajo = idtrabajo;
        this.contacto = contacto;
        this.cant_empleados = cant_empleados;
        this.descripcion = descripcion;
        this.caracteristicas = caracteristicas;
        this.precio_diario = precio_diario;
        this.estado = estado;
        this.tipo_trabajo = tipo_trabajo;
    }

    public vtrabajo() {
    }

    public int getIdtrabajo() {
        return idtrabajo;
    }

    public void setIdtrabajo(int idtrabajo) {
        this.idtrabajo = idtrabajo;
    }

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public String getCant_Empleados() {
        return cant_empleados;
    }

    public void setCant_Empleados(String cant_empleados) {
        this.cant_empleados = cant_empleados;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCaracteristicas() {
        return caracteristicas;
    }

    public void setCaracteristicas(String caracteristicas) {
        this.caracteristicas = caracteristicas;
    }

    public Double getPrecio_diario() {
        return precio_diario;
    }

    public void setPrecio_diario(Double precio_diario) {
        this.precio_diario = precio_diario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getTipo_trabajo() {
        return tipo_trabajo;
    }

    public void setTipo_trabajo(String tipo_trabajo) {
        this.tipo_trabajo = tipo_trabajo;
    }
    
    
    
    
}
