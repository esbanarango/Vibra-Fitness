jQuery ->

	$("#plan_max_age").val( if $("#plan_max_age").val() is "" then 99 else $("#plan_max_age").val())
	$("#plan_min_age").val( if $("#plan_min_age").val() is "" then 10 else $("#plan_min_age").val())
	max = parseInt($("#plan_max_age").val())
	min = parseInt($("#plan_min_age").val())
	$("#slider-range").slider
	  range: true
	  min: 1
	  max: 60
	  values: [ min, max ]
	  slide: (event, ui) ->
	    $("#lAgeRange").text ui.values[0] + " - " + ui.values[1]
	    $("#plan_min_age").val ui.values[0]
	    $("#plan_max_age").val ui.values[1]

	$( "#lAgeRange" ).text( $( "#slider-range" ).slider( "values", 0 ) + " - " + $( "#slider-range" ).slider( "values", 1 ) )

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

	$("#plan_start_time").timepicker optionsTimePicker
	optionsTimePicker["timeOnlyTitle"] = "Hora Fin"
	$("#plan_end_time").timepicker optionsTimePicker