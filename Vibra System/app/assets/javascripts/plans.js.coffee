jQuery ->

minYearRange = parseInt($("#minRangeYear").val())
maxYearRange = parseInt($("#maxRangeYear").val())
$("#slider-range").slider
  range: true
  min: minYearRange
  max: maxYearRange
  values: [ minYearRange, maxYearRange ]
  slide: (event, ui) ->
    $("#yearRange").val ui.values[0] + " - " + ui.values[1]
    $("#minRangeYear").val ui.values[0]
    $("#maxRangeYear").val ui.values[1]