$ ->
  push_screenshot = (data) ->
    $dom = siteDom(data.site_id)
    $dom.find('.site-thumb').attr('src', data.thumb_url)

  push_points = (data) ->
    $dom = siteDom(data.site_id)
    $dom.find('.site-points').html(data.points.number_with_delimiter())

  siteDom = (site_id) ->
    $(".work[data-site-id='#{site_id}']")

  teamId = $("#team_id").val()
  if teamId?
    pusher = new Pusher("b1276f161ff68bbd81e4")
    channel = pusher.subscribe("team_#{teamId}")

    channel.bind "push_screenshot", (data) ->
      console?.log(data)
      push_screenshot(data)

    channel.bind "push_points", (data) ->
      console?.log(data)
      push_points(data)
