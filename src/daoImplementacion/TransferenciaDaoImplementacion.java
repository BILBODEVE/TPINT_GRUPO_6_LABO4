package daoImplementacion;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

import dao.TransferenciaDao;
import entidades.Cuenta;
import entidades.Transferencia;

public class TransferenciaDaoImplementacion implements TransferenciaDao {

    @Override
    public boolean insertarTransferencia(Transferencia transferencia) {
    	
    	Connection conexion = null;
        PreparedStatement statement= null;
     	ResultSet rs= null;
     	
        String query = "INSERT INTO transferencias (cuenta_origen, cuenta_destino, monto, fecha) VALUES (?, ?, ?, ?)";

        try {
            conexion = Conexion.getConexion().getSQLConexion();
            statement = conexion.prepareStatement(query);

            statement.setInt(1, transferencia.getCuentaOrigen().getId());
            statement.setInt(2, transferencia.getCuentaDestino().getId());
            statement.setDouble(3, transferencia.getMonto());
            statement.setTimestamp(4, java.sql.Timestamp.valueOf(transferencia.getFecha()));

            if (statement.executeUpdate() > 0) {
                conexion.commit();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    

    @Override
    public List<Transferencia> listarTransferenciasPorCuenta(int cuentaId) {
    	Connection conexion = null;
        PreparedStatement statement= null;
   	 	ResultSet rs= null;
        List<Transferencia> transferencias = new ArrayList<>();

        String query = "SELECT t.id, t.id_cuenta_origen, t.id_cuenta_destino, t.monto, t.fecha, " +
                       "co.cbu AS cbu_origen, cd.cbu AS cbu_destino " +
                       "FROM transferencias t " +
                       "INNER JOIN cuentas co ON t.id_cuenta_origen = co.id " +
                       "INNER JOIN cuentas cd ON t.id_cuenta_destino = cd.id " +
                       "WHERE t.id_cuenta_origen = ? OR t.id_cuenta_destino = ? " +
                       "ORDER BY t.fecha DESC";

       

        try {
            conexion = Conexion.getConexion().getSQLConexion();
            statement = conexion.prepareStatement(query);
            statement.setInt(1, cuentaId);
            statement.setInt(2, cuentaId);
            rs = statement.executeQuery();

            while (rs.next()) {
                Transferencia transferencia = new Transferencia();
                transferencia.setId(rs.getInt("id"));

                Cuenta cuentaOrigen = new Cuenta();
                cuentaOrigen.setId(rs.getInt("id_cuenta_origen"));
                cuentaOrigen.setCBU(new BigInteger(rs.getString("cbu_origen")));
                transferencia.setCuentaOrigen(cuentaOrigen);

                Cuenta cuentaDestino = new Cuenta();
                cuentaDestino.setId(rs.getInt("id_cuenta_destino"));
                cuentaDestino.setCBU(new BigInteger(rs.getString("cbu_destino")));
                transferencia.setCuentaDestino(cuentaDestino);

                transferencia.setMonto(rs.getDouble("monto"));
                transferencia.setFecha(rs.getTimestamp("fecha").toLocalDateTime());

                transferencias.add(transferencia);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transferencias;
    }
}
