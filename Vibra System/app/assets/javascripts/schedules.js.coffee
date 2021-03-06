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

	#---- BOOKING FUNCTIONS ----#
	  # Search form.
	 $('#clients_search input').keyup (e) ->
    e.preventDefault()
    $(@).addClass "loadingInput"
    $.get($('#clients_search').attr('action'), $('#clients_search').serialize(), null, 'script')
    .complete(=> $(@).removeClass "loadingInput")

  $("#clients_schedule.nano").nanoScroller()

  #Drag and drop funcionality
  #DROP
	$(".client_drop").droppable
	  activeClass: "ui-state-hover"
	  hoverClass: "ui-state-active"
	  accept: ".client_drag"
	  drop: (event, ui) ->
	    # Which is the client status (expired or out of horary)
	    if !$(ui.draggable).data("status")
	      classColor = "expired"
	    else
	      #Check if client is out of the horary plan
	      hStart = parseInt($(this).parent().data("horarystart"))
	      hEnd = parseInt($(this).parent().data("horaryend"))
	      hStartPlan =parseInt($(ui.draggable).data("horarystart"))
	      hEndPlan	=parseInt($(ui.draggable).data("horaryend"))
	      classColor = (if (hStart < hStartPlan) or (hEnd > hEndPlan) then "different-time" else "")
	    scheduleId = $(this).parent().data("idturn")
	    clientId = $(ui.draggable).data("idclient")
	    numMachine = $(this).data("nummachine")
	    # $(this).find("div.inside_turn").size() is 0	
	    if $(this).find("div.inside_turn").size() is 0	 # -> There isn't anyone on this turn
	      closeTag = "<a rel='tooltip' data-original-title='Cancelar reserva' class='close deleteTurn' href='#'>×</a>"
	      textShow = "<h5>"+$(ui.draggable).find(".client_drag_name").text()+" "+$(ui.draggable).find(".client_drag_last_name").text()+"</h5> / <em>"+$(ui.draggable).find(".client_drag_plan").text()+"</em>"
	      $(this).prepend ("<div class=' #{classColor} inside_turn' data-idturn='#{scheduleId}' data-idclient='#{clientId}' data-nummachine='#{numMachine}' > #{closeTag} #{textShow}</div>")
	      reserveTurn(scheduleId,clientId,numMachine,$(this).parent().data("idseat"),false)
	    else # -> Waiting list action
	      $(this).find(".waiting_list_title").show()
	      waitingContainer = $(this).find(".waiting_list_title .waiting_list_container section")
	      closeTag = "<a rel='tooltip' data-original-title='Retirar de lista de espera' data-where='waiting' class='close deleteTurn' href='#'>×</a>"
	      textShow = "<h5>"+$(ui.draggable).find(".client_drag_name").text()+" "+$(ui.draggable).find(".client_drag_last_name").text()+"</h5>"
	      waitingContainer.append ("<div data-plan='#{$(ui.draggable).find('.client_drag_plan').text()}' data-idturn='#{scheduleId}' data-classstatus='#{classColor}' data-idclient='#{clientId}' data-nummachine='#{numMachine}'>#{closeTag}#{textShow}</div>")
	      reserveTurn(scheduleId,clientId,numMachine,$(this).parent().data("idseat"),true)
	    $('.deleteTurn').tooltip() #Reactive the tooltip for the new element

  #DRAG
	$(".client_drag").draggable 
	  revert: true
	  opacity: 0.6
	  cursor: "move"
	  handle: ".client_drag_handle"
	  helper: (event) ->  
	    $( "<div class='alert alert-block'></div>" ).html("<h4 class='alert-heading'>"+$(this).find(".client_drag_name").text()+" "+$(this).find(".client_drag_last_name").text()+"</h4>")
	  appendTo: 'body'
  
  reserveTurn = (scheduleId,clientId,numMachine,seatId,waitingList) ->
    $.ajax
      type: "POST"
      url: "/seats/#{seatId}/schedules/#{scheduleId}"
      data:
        _method: "put"
        waiting: waitingList
        machine:
          machine_num: numMachine
          client_id: clientId
      error: ->
      success: ->
      dataType: "script"


	#Waiting List
  $(document).on "click", ".waiting_list_title", (e) ->	
    id = $(@).data("idrelated")
    $("##{id}").slideDown "fast"

  #Close waiting lists when click outside
  mouse_in = false
  $(".waiting_list_container").hover (->
    mouse_in = true
  ), ->
    mouse_in = false

  $("body").mouseup ->
    $(".waiting_list_container").slideUp 300  unless mouse_in


  #Cancel reservation
  
  $('.deleteTurn').tooltip() #Activar Tooltip

  $(document).on "click", "a.deleteTurn", (e) ->
	  e.preventDefault
	  if confirm("Está seguro que desea cancelar este turno?")
	  	waitingList = if $(this).data("where") is "waiting" then true else false
		  turn = $(this).parent()
		  $.ajax
		    type: "DELETE"
		    url: "/schedules/cancel_turn"
		    data:
		      _method: "delete"
		      waiting: waitingList
		      machine:
		        client_id: turn.data("idclient")
		        schedule_id: turn.data("idturn")
		        machine_num: turn.data("nummachine")

		    dataType: "script"
		    success: ->
		      turn.slideUp 400, ->
		        parent = $(@).parent()
		        $(@).remove()
		        if waitingList 
		          if parent.find("div").size() == 0 # If it was the only one in the waiting list
		            parent.parent().slideUp 300, ->
		              $(@).parent().slideUp 300
		        else
		          waitingContainer = parent.find(".waiting_list_title .waiting_list_container section")
		          if waitingContainer.find("div").size() > 0
		            console.log waitingContainer.find("div").size()
		            if waitingContainer.find("div").size() == 1 then waitingContainer.parent().parent().hide()
		            #Transform the waiting element to be showen as the actual turn
		            element = waitingContainer.find("div:first") #Copy the element
		            waitingContainer.find("div:first").remove()  #Remove the client from the waiting list
		            classColor = element.data("classstatus")
		            #Add the respective classes
		            element.addClass(classColor)
		            element.addClass("inside_turn")
		            element.find("a.deleteTurn").data("original-title","Cancelar reserva")
		            element.find("a.deleteTurn").data("where","")
		            element.append(" / <em>#{element.data('plan')}</em>")
		            parent.prepend(element)
		            from_waiting_to_current(element.data("idclient"),false)
		            $('.deleteTurn').tooltip() #Reactive the tooltip for the new element		            

		  false
	  else
		  false


  from_waiting_to_current = (clientId,waitingList) ->
    $.ajax
      type: "POST"
      url: "/schedules/from_waiting_to_current"
      data:
        _method: "put"
        waiting: waitingList
        machine:
          client_id: clientId
      error: ->
      success: ->
      dataType: "script"






