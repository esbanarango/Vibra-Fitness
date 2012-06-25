jQuery ->

	#---- TIME PICKERS ----#

	$("#conf_schedule_start_time").timepicker
		timeOnlyTitle: "Hora Inicio"
		hourText: "Hora"
		minuteText: "Minuto"
		currentText: "Ahora"
		closeText: "Listo"
		timeText: ""
		ampm: false
		hourMin: 5
		hourMax: 22
		onClose: (dateText, inst) ->
	    endDateTextBox = $("#conf_schedule_end_time")
	    unless endDateTextBox.val() is ""
	      testStartDate = new Date("October 13, 1975  "+dateText)
	      testEndDate = new Date("October 13, 1975  "+endDateTextBox.val())
	      endDateTextBox.val dateText  if testStartDate > testEndDate
	    else
	      endDateTextBox.val dateText
	  onSelect: (selectedDateTime) ->
	    start = $(this).datetimepicker("getDate")
	    $("#conf_schedule_end_time").datetimepicker new Date(start.getTime())

	$("#conf_schedule_end_time").timepicker
		timeOnlyTitle: "Hora Fin"
		hourText: "Hora"
		minuteText: "Minuto"
		currentText: "Ahora"
		closeText: "Listo"
		timeText: ""
		ampm: false
		hourMin: 5
		hourMax: 22
		onClose: (dateText, inst) ->
		  startDateTextBox = $("#conf_schedule_start_time")
		  unless startDateTextBox.val() is ""
		    testStartDate = new Date("October 13, 1975  "+startDateTextBox.val())
		    testEndDate = new Date("October 13, 1975  "+dateText)
		    startDateTextBox.val dateText  if testStartDate > testEndDate
		  else
		    startDateTextBox.val dateText
		onSelect: (selectedDateTime) ->
		  end = $(this).datetimepicker("getDate")
		  $("#conf_schedule_start_time").datetimepicker new Date(end.getTime())	  

	$("#schedule_start_time").timepicker
		timeOnlyTitle: "Hora Inicio"
		hourText: "Hora"
		minuteText: "Minuto"
		currentText: "Ahora"
		closeText: "Listo"
		timeText: ""
		ampm: false
		hourMin: 5
		hourMax: 22
		onClose: (dateText, inst) ->
		  endDateTextBox = $("#schedule_end_time")
		  unless endDateTextBox.val() is ""
		    testStartDate = new Date("October 13, 1975  "+dateText)
		    testEndDate = new Date("October 13, 1975  "+endDateTextBox.val())
		    endDateTextBox.val dateText  if testStartDate > testEndDate
		  else
		    endDateTextBox.val dateText
		onSelect: (selectedDateTime) ->
		  start = $(this).datetimepicker("getDate")
		  $("#schedule_end_time").datetimepicker new Date(start.getTime())

	$("#schedule_end_time").timepicker
		timeOnlyTitle: "Hora Fin"
		hourText: "Hora"
		minuteText: "Minuto"
		currentText: "Ahora"
		closeText: "Listo"
		timeText: ""
		ampm: false
		hourMin: 5
		hourMax: 22
		onClose: (dateText, inst) ->
		  startDateTextBox = $("#schedule_start_time")
		  unless startDateTextBox.val() is ""
		    testStartDate = new Date("October 13, 1975  "+startDateTextBox.val())
		    testEndDate = new Date("October 13, 1975  "+dateText)
		    startDateTextBox.val dateText  if testStartDate > testEndDate
		  else
		    startDateTextBox.val dateText
		onSelect: (selectedDateTime) ->
		  end = $(this).datetimepicker("getDate")
		  $("#schedule_start_time").datetimepicker new Date(end.getTime())	  


	#---- FORM VALIDATIONS ----#

  #Validate form "configuración rápida"
	$("#new_conf_schedule").validate
	  errorClass: "help-inline"
	  errorElement: "span"
	  highlight: (element, errorClass, validClass) ->
	    $(element).parents(".control-group").addClass "error"

	  unhighlight: (element, errorClass, validClass) ->
	    $(element).parents(".control-group").removeClass "error"

  #Validate form "configuración rápida"
	$("#new_schedule").validate
	  errorClass: "help-inline"
	  errorElement: "span"
	  highlight: (element, errorClass, validClass) ->
	    $(element).parents(".control-group").addClass "error"

	  unhighlight: (element, errorClass, validClass) ->
	    $(element).parents(".control-group").removeClass "error"	    


  #Delete Action
  $(document).on "click", "a.deleteSchedule", (e) ->
	  e.preventDefault
	  if confirm("Está seguro que desea eliminar este turno?")
		  row = $(this).closest("tr").get(0)
		  $.ajax
		    type: "POST"
		    url: @href
		    data:
		      _method: "delete"
		    dataType: "script"
		    beforeSend: ->
		      $(row).find("td").each ->
			      $(@).animate
			        backgroundColor: "#fb6c6c"
			      , 800
		    success: ->
		      $(row).hide 1000, ->
		        $(row).remove()
		  false
	  else
		  false	    





