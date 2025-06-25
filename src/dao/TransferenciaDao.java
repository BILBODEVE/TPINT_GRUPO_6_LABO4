package dao;

import java.util.List;
import entidades.Transferencia;

public interface TransferenciaDao {
    boolean insertarTransferencia(Transferencia transferencia);
    List<Transferencia> listarTransferenciasPorCuenta(int cuentaId);
}