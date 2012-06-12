jQuery ->
  $("#new_client").on "submit", (e) ->
    $("#cargando").find("label").text("Enviando correo...")
    $("#cargando").show()