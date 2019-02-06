$(document).ready(function() {

$('#user').keypress(function(tecla) {
        if(tecla.charCode == 32) return false;
    });
$('#pass').keypress(function(tecla) {
        if(tecla.charCode == 32) return false;
    });

});


$('#verpass').click(function(){
	if($('#verpass').is(':checked')){
		$("#pass").attr('type','text');
	}else{
		$("#pass").attr('type','password');
	}
});

function formu(valor) {
		var nombre1=$('#InputNombre1').val();
		var nombre2=$('#InputNombre2').val();
		var apellido1=$('#InputApellido1').val();
		var apellido2=$('#InputApellido2').val();
		var email=$('#InputEmail').val();
		var cedula=$('#InputCedula').val();
		var telefono=$('#InputTelefono').val();
		var selectSexo=$('#SelectSexo').val();
		var civil=$('#SelectCivil').val();

		var usuario=$('#InputUsuario').val();
		var password=$('#InputPassword').val();
		var confirmarpassword=$('#ConfirmarPassword').val();

		var parametros='nombre1='+nombre1+'&nombre2='+nombre2+'&apellido1='+apellido1+'&apellido1='+apellido2+
						'&email='+email+'&cedula='+cedula+'&telefono='+telefono+'&sexo='+selectSexo+'&civil='+civil+
						'&usuario='+usuario+'&password='+password+'&ConfirmarPassword='+confirmarpassword;
	if(valor==0){
		if(nombre1=='' || nombre2=='' || apellido1=='' || apellido2=='' || selectSexo=='' || email=='' || civil=='' || cedula=='' || telefono==''){
			$('#error').html('Debe llenar todos los datos');
		}else{
			$("#formulario1").removeClass('active');
			$("#formulario2").addClass('active');
			$('#error').html('');
		}
	}else if(valor==1){
		$("#formulario1").addClass('active');
		$("#formulario2").removeClass('active');
	}else if(valor==2){
		
		if(usuario=='' || password=='' || ConfirmarPassword==''){
			$('#error').html('Debe llenar todos los datos');
		}else if(password!=confirmarpassword){
				$('#error').html('las password coinciden');
		}else{
			$("#formulario3").addClass('active');
			$("#formulario2").removeClass('active');
			$('#error').html('');
		}
	}else if(valor==3){
		$("#formulario2").addClass('active');
		$("#formulario3").removeClass('active');
	}else if(valor==4){
		alert(parametros);
		var url = 'Agregar.php?'+parametros;
		window.location.href=url;
	}
}



