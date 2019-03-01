//alert("hola");
var dataFromLocalStorage = JSON.parse(localStorage.getItem("data1"));

//alert(dataFromLocalStorage.uname);

$.ajax({
    type: "POST",
    url: "../acead/modelos/usuarios.modelo.php?caso=cargapreguntas&un="+dataFromLocalStorage.uname,
    dataType: 'json',
    success: function(data)
    {
        //alert(data);
        //$('#preguntas').html(response).fadeIn();
        $.each(data, function(i, item){
            //alert(item[1]);
            $('#cbopreguntas').append("<option value='"+item[0]+"'>"+item[1]+"</option>");
        });
    },
    error: function(xhr, status){
        alert(xhr + " >> " + status);
    }
});