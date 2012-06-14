jQuery ->

  $("#new_client").on "submit", (e) ->
    $("#cargando").show()
    setTimeout("$('#cargando').find('label').text('Enviando correo...')","2000")
  # Sorting and pagination links.
  $( document ).on "click", "#clients th a", (e) ->
    e.preventDefault()
    $.getScript(@.href)

  # Search form.
  $('#clients_search input').keyup (e) ->
    e.preventDefault()
    $(@).addClass "loadingInput"
    $.get($('#clients_search').attr('action'), $('#clients_search').serialize(), null, 'script')
    .complete(=> $(@).removeClass "loadingInput")