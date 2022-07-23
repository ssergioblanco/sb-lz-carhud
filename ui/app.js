$(function(){
    console.log("SB-LZ CARHUD INITIALIZED") // Para printear en el f8
    window.addEventListener('message', function(event){ // AddEvent listener.
        let e = event.data; // Coger eventos

        if (e.action === "InVeh"){ // si e.action === InVeh entonces...
            $('.cuadro').show(); // mostrar carhud
            $('.velocidadact').text(Math.round(e.kmh) + ""); // cambiar el texto de velocidadact por el mensaje evento kmh
            $('.gasolinact').text(Math.round(e.fuel) + "%");  // cambiar el texto de gasolinact por el mensaje evento fuel, y poner % al final
            $('.marchact').text(e.gear); // cambiar el texto de marchact por el mensaje evento gear, y poner
            $('.dañoact').text(Math.round(e.salud / 10) + "%"); // cambiar el texto de dañoact por el mensaje evento damage, y poner % al final
        } else if (e.action === "outVeh"){ // si la accion es outVeh entonces...
            $('.cuadro').hide(); // ocultar carhud
        } // fin
    }); // fin
}); // fin
