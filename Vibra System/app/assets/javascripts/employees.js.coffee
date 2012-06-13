jQuery ->
  # Sorting and pagination links.
  $( document ).on "click", "#employees th a", (e) ->
    e.preventDefault()
    $.getScript(@.href)

  # Search form.
  $('#employees_search input').keyup (e) ->
    e.preventDefault()
    $.get($('#employees_search').attr('action'), $('#employees_search').serialize(), null, 'script')