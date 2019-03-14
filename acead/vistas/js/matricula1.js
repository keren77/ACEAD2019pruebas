var modalidadID, orientacionID, claseID, seccionID;

$('#matriculaModalidad').change(function(){
    modalidadID = $(this).val();
    
    rellenaOrientacion(modalidadID);
});

$('#adicionar1').click(function(){
    //alert($('select[name=adicionar1] option:selected').text());
    orientacionID = $('select[name=adicionar1] option:selected').val();
    rellenarClases(orientacionID);
});
$('#adicionar2').click(function(){
    //alert($('select[name=adicionar1] option:selected').text());
    claseID = $('select[name=adicionar2] option:selected').val();
    rellenarSecciones(claseID);
  
});

function rellenaOrientacion(idm){
    
    param1 = {
        "idmodalidad": idm
    };
    
    $.ajax({        
        type: "POST",
        url: "../acead/modelos/alumnos.modelo.php?caso=cargaorientacion",
        data: param1,
        dataType: 'json',
        success: function(data){
            $('#adicionar1').empty();
            $.each(data, function(i, item){
                //alert(item.ID);                
                $('#adicionar1').append('<option value="'+item.ID+'">'+item.nombre+'</option>');
            });
        },
        error: function(xhr, status){
            alert("ERROR: " + xhr + " >> " + status);
        }
    });
}

function rellenarClases(ido){
    param1 = {
        "idorientacion": ido
    };
    
    $.ajax({        
        type: "POST",
        url: "../acead/modelos/alumnos.modelo.php?caso=cargaclases",
        data: param1,
        dataType: 'json',
        success: function(data){
            $('#adicionar2').empty();
            $.each(data, function(i, item){
                //alert(item.ID);                
                $('#adicionar2').append('<option value="'+item.IDC+'">'+item.DC+'</option>');
            });
        },
        error: function(xhr, status){
            alert("ERROR: " + xhr + " >> " + status);
        }
    });
}
function rellenarSecciones(idc){

    param1 = {
        "idclase": idc
    };
    
    $.ajax({        
        type: "POST",
        url: "../acead/modelos/alumnos.modelo.php?caso=cargasecciones",
        data: param1,
        dataType: 'json',
        success: function(data){
            $('#adicionar3').empty();
            $.each(data, function(i, item){
                //alert(item.ID);                
                $('#adicionar3').append('<option value="'+item.ISE+'">'+item.DS+'</option>');
            });
        },
        error: function(xhr, status){
            alert("ERROR: " + xhr + " >> " + status);
        }
    });
}