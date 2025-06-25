package negocio;

import java.util.List;

import entidades.Transferencia;

public interface TransferenciaNegocio {
    boolean realizarTransferencia(Transferencia transferencia);
    List<Transferencia> listarTransferenciasPorCuenta(int cuentaId);
}
