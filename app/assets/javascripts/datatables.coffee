$ ->
  $('#children-table').dataTable
    processing: true
    autoWidth: false
    responsive: true
    serverSide: true
    ajax: $('#children-table').data('source')
    pagingType: 'full_numbers'

$ ->
  $('#visitor-messages-table').dataTable
    processing: true
    autoWidth: false
    responsive: true
    serverSide: true
    ajax: $('#visitor-messages-table').data('source')
    pagingType: 'full_numbers'