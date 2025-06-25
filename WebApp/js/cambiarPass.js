function habilitarCampos() {
        document.getElementById("nuevaClave").disabled = false;
        document.getElementById("confirmarClave").disabled = false;
        document.getElementById("btnCambiar").disabled = false;
		
   
		const usuarioInput = document.getElementById("usuario");
		    usuarioInput.readOnly = true;
		    usuarioInput.focus();
	}