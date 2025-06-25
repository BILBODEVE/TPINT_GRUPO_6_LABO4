package negocioImplementacion;

import java.time.LocalDateTime;
import java.util.List;

import daoImplementacion.Conexion;
import daoImplementacion.CuentaDaoImplementacion;
import daoImplementacion.TransferenciaDaoImplementacion;
import entidades.Cuenta;
import entidades.Transferencia;
import negocio.TransferenciaNegocio;

public class TransferenciaNegocioImplementacion implements TransferenciaNegocio {

    private TransferenciaDaoImplementacion transferenciaDao = new TransferenciaDaoImplementacion();
    private CuentaDaoImplementacion cuentaDao = new CuentaDaoImplementacion();

    @Override
    public boolean realizarTransferencia(Transferencia transferencia) {
        if (transferencia.getMonto() <= 0) {
            return false;
        }

        Cuenta cuentaOrigen = transferencia.getCuentaOrigen();
        Cuenta cuentaDestino = transferencia.getCuentaDestino();

        
        if (cuentaOrigen.getSaldo() < transferencia.getMonto()) {
            return false; 
        }

       
        cuentaOrigen.setSaldo(cuentaOrigen.getSaldo() - transferencia.getMonto());
        cuentaDestino.setSaldo(cuentaDestino.getSaldo() + transferencia.getMonto());

       
        transferencia.setFecha(LocalDateTime.now());

      
        boolean insertOk = transferenciaDao.insertarTransferencia(transferencia);
        if (!insertOk) {
            return false;
        }

  
        boolean actualizoOrigen = actualizarSaldoCuenta(cuentaOrigen);
        boolean actualizoDestino = actualizarSaldoCuenta(cuentaDestino);

        return actualizoOrigen && actualizoDestino;
    }

    private boolean actualizarSaldoCuenta(Cuenta cuenta) {
        String query = "UPDATE cuentas SET saldo = ? WHERE id = ?";
        try {
            var conexion = Conexion.getConexion().getSQLConexion();
            var ps = conexion.prepareStatement(query);
            ps.setDouble(1, cuenta.getSaldo());
            ps.setInt(2, cuenta.getId());

            int filas = ps.executeUpdate();
            if (filas > 0) {
                conexion.commit();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Transferencia> listarTransferenciasPorCuenta(int cuentaId) {
        return transferenciaDao.listarTransferenciasPorCuenta(cuentaId);
    }
}
