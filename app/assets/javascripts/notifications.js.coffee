class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    @setup() if @notifications.length > 0

  setup: ->
    $("[data-behavior='notification-link']").on "click", @handleClick
    $.ajax(
      url: "/notifications.json"
      dataType: 'JSON'
      method: 'GET'
      success: @handleSuccess
    )

  handleClick: (e) =>
    $.ajax(
      url: "/notifications/mark_as_read"
      dataType: 'JSON'
      method: 'POST'
      success: ->
        $("[data-behavior='notification-unreadcount']").html(0)
    )

  handleSuccess: (data) =>
    console.log(data)
    items = $.map data, (notification) ->
      "<li><a href='#{notification.url}'>#{notification.actor} #{notification.action} #{notification.notifiable.type}</a></li>"
    $("[data-behavior='notification-unreadcount']").html(items.length)
    $("[data-behavior='notification-items']").html(items)

jQuery ->
  new Notifications
