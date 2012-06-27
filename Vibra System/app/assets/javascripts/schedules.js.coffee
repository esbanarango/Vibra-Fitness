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

  #Booking funcions
	  # Search form.
	 $('#clients_search input').keyup (e) ->
    e.preventDefault()
    $(@).addClass "loadingInput"
    $.get($('#clients_search').attr('action'), $('#clients_search').serialize(), null, 'script')
    .complete(=> $(@).removeClass "loadingInput")

  $("#clients_schedule.nano").nanoScroller()

  #Drag adn drop funcionality
	$(".client_drop").droppable
	  activeClass: "ui-state-hover"
	  hoverClass: "ui-state-active"
	  accept: ".client_drag"
	  drop: (event, ui) ->  
		  closeTag = "<a class='close' href='#'>×</a>"
		  if !$(ui.draggable).data("status") 
			  classColor = "expired"
		  else
		    #Check if client is out of the horary plan
			  hStart = parseInt($(this).parent().data("horarystart"))
			  hEnd = parseInt($(this).parent().data("horaryend"))
			  hStartPlan =parseInt($(ui.draggable).data("horarystart") )
			  hEndPlan	=parseInt($(ui.draggable).data("horaryend"))
			  classColor = (if (hStart < hStartPlan) or (hEnd > hEndPlan) then "different-time" else "")
		  textShow = "<h5>"+$(ui.draggable).find(".client_drag_name").text()+" "+$(ui.draggable).find(".client_drag_last_name").text()+"</h5> / <em>"+$(ui.draggable).find(".client_drag_plan").text()+"</em>"
		  $(this).append ("<div class=' #{classColor} inside_turn'> #{closeTag} #{textShow}</div>")
		  reserveTurn($(this).parent().data("idturn"),$(ui.draggable).data("idclient"),$(this).data("nummachine"),$(this).parent().data("idseat"))


	$(".client_drag").draggable 
	  opacity: 0.6
	  cursorAt: 
	    top: 30
	    left: 80
	  cursor: "move"
	  handle: ".client_drag_handle"
	  helper: (event) ->  
	    $( "<div class='alert alert-block'></div>" ).html("<h4 class='alert-heading'>"+$(this).find(".client_drag_name").text()+" "+$(this).find(".client_drag_last_name").text()+"</h4>")
	  appendTo: 'body'
  
  reserveTurn = (scheduleId,clientId,numMachine,seatId) ->
    console.log(scheduleId,clientId,numMachine,seatId)
    $.ajax
      type: "POST"
      url: "/seats/#{seatId}/schedules/#{scheduleId}"
      data:
        _method: "put"
        machine:
          machine_num: numMachine
          client_id: clientId
      error: ->
      success: ->
      dataType: "script"










