$ ->
  $('#children-table').dataTable
    processing: true
    autoWidth: false
    responsive: true
    serverSide: true
    ajax: $('#children-table').data('source')
    pagingType: 'full_numbers'

$ ->
  $('#lectures-table').dataTable
    processing: true
    autoWidth: false
    responsive: true
    serverSide: true
    ajax: $('#lectures-table').data('source')
    pagingType: 'full_numbers'

$ ->
  $('#workshops-table').dataTable
    processing: true
    autoWidth: false
    responsive: true
    serverSide: true
    ajax: $('#workshops-table').data('source')
    pagingType: 'full_numbers'

$ ->
  $('#shepperdings-table').dataTable
    processing: true
    autoWidth: false
    responsive: true
    serverSide: true
    ajax: $('#shepperdings-table').data('source')
    pagingType: 'full_numbers'

$ ->
  $('#commissions-table').dataTable
    processing: true
    autoWidth: false
    responsive: true
    serverSide: true
    ajax: $('#commissions-table').data('source')
    pagingType: 'full_numbers'

$ ->
  $('#visitor-messages-table').dataTable
    processing: true
    autoWidth: false
    responsive: true
    serverSide: true
    ajax: $('#visitor-messages-table').data('source')
    pagingType: 'full_numbers'