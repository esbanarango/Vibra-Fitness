jQuery ->

	optionsTimePicker =
	  timeOnlyTitle: "Hora Inicio"
	  hourText: "Hora"
	  minuteText: "Minuto"
	  currentText: "Ahora"
	  closeText: "Listo"
	  timeText: ""
	  ampm: false
	  hourMin: 6
	  hourMax: 22

	$("#conf_schedule_start_time").timepicker optionsTimePicker
	optionsTimePicker["timeOnlyTitle"] = "Hora Fin"
	$("#conf_schedule_end_time").timepicker optionsTimePicker	

	$("#new_conf_schedule").validate
	  errorClass: "help-inline"
	  errorElement: "span"
	  highlight: (element, errorClass, validClass) ->
	    $(element).parents(".control-group").addClass "error"

	  unhighlight: (element, errorClass, validClass) ->
	    $(element).parents(".control-group").removeClass "error"

#Delete Action
$("a.deleteSchedule").click ->
  if confirm("Está seguro que desea eliminar este turno?")
    row = $(this).closest("tr").get(0)
    $.post @href,
      _method: "delete"
    , null, "script"
    $(row).slideUp("slow")
    false
  else
    false	    