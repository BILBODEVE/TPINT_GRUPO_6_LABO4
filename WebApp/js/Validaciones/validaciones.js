function formatearCUIL(inputNameCuil) {
	document.getElementById(inputNameCuil).addEventListener(
		'input',
		function(e) {
			let input = e.target;
			let value = input.value;

			value = value.replace(/\D/g, '');

			if (value.length > 11)
				value = value.slice(0, 11);

			let formatted = '';
			if (value.length > 0) {
				formatted += value.substring(0, Math.min(2,
					value.length));
			}
			if (value.length >= 3) {
				formatted += '-'
					+ value
						.substring(2, Math
							.min(10, value.length));
			}
			if (value.length > 10) {
				formatted += '-' + value.substring(10);
			}
			input.value = formatted;
		});
}

function formatearDNI(inputNameDni) {
	document.getElementById(inputNameDni).addEventListener("input",
		function(e) {
			let digitsOnly = e.target.value.replace(/\D/g, '');

			if (digitsOnly.length > 8) {
				digitsOnly = digitsOnly.slice(0, 8);
			}

			e.target.value = digitsOnly;
		});
}