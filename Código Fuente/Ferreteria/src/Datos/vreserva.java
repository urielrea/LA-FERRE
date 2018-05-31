
package Datos;

import java.sql.Date;

public class vreserva {
    private int idreserva;
    private int idtrabajo;
    private int idcliente;
    private int idtrabajador;
    private String tipo_reserva;
    private Date fecha_reserva;
    private Date fecha_ingresa;
    private Date fecha_salida;
    private Double costo_reserva;
    private String estado;

    public vreserva() {
    }

    public vreserva(int idreserva, int idtrabajo, int idcliente, int idtrabajador, String tipo_reserva, Date fecha_reserva, Date fecha_ingresa, Date fecha_salida, Double costo_reserva, String estado) {
        this.idreserva = idreserva;
        this.idtrabajo = idtrabajo;
        this.idcliente = idcliente;
        this.idtrabajador = idtrabajador;
        this.tipo_reserva = tipo_reserva;
        this.fecha_reserva = fecha_reserva;
        this.fecha_ingresa = fecha_ingresa;
        this.fecha_salida = fecha_salida;
        this.costo_reserva = costo_reserva;
        this.estado = estado;
    }

    public int getIdreserva() {
        return idreserva;
    }

    public void setIdreserva(int idreserva) {
        this.idreserva = idreserva;
    }

    public int getIdtrabajo() {
        return idtrabajo;
    }

    public void setIdtrabajo(int idtrabajo) {
        this.idtrabajo = idtrabajo;
    }

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    public int getIdtrabajador() {
        return idtrabajador;
    }

    public void setIdtrabajador(int idtrabajador) {
        this.idtrabajador = idtrabajador;
    }

    public String getTipo_reserva() {
        return tipo_reserva;
    }

    public void setTipo_reserva(String tipo_reserva) {
        this.tipo_reserva = tipo_reserva;
    }

    public Date getFecha_reserva() {
        return fecha_reserva;
    }

    public void setFecha_reserva(Date fecha_reserva) {
        this.fecha_reserva = fecha_reserva;
    }

    public Date getFecha_ingresa() {
        return fecha_ingresa;
    }

    public void setFecha_ingresa(Date fecha_ingresa) {
        this.fecha_ingresa = fecha_ingresa;
    }

    public Date getFecha_salida() {
        return fecha_salida;
    }

    public void setFecha_salida(Date fecha_salida) {
        this.fecha_salida = fecha_salida;
    }

    public Double getCosto_reserva() {
        return costo_reserva;
    }

    public void setCosto_reserva(Double costo_reserva) {
        this.costo_reserva = costo_reserva;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
    
}
