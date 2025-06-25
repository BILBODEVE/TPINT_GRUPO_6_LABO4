package entidades;

import java.time.LocalDateTime;

public class Transferencia {
    private int id;
    private Cuenta cuentaOrigen;
    private Cuenta cuentaDestino;
    private double monto;
    private LocalDateTime fecha;
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Cuenta getCuentaOrigen() { return cuentaOrigen; }
    
    public void setCuentaOrigen(Cuenta cuentaOrigen) { this.cuentaOrigen = cuentaOrigen; }

    public Cuenta getCuentaDestino() { return cuentaDestino; }
    public void setCuentaDestino(Cuenta cuentaDestino) { this.cuentaDestino = cuentaDestino; }

    public double getMonto() { return monto; }
    public void setMonto(double monto) { this.monto = monto; }

    public LocalDateTime getFecha() { return fecha; }
    public void setFecha(LocalDateTime fecha) { this.fecha = fecha; }

    @Override
    public String toString() {
        return "Transferencia [id=" + id + ", cuentaOrigen=" + cuentaOrigen.getCBU() + ", cuentaDestino=" + cuentaDestino.getCBU() + ", monto=" + monto + ", fecha=" + fecha + "]";
    }

	
}
