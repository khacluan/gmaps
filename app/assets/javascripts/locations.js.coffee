window.initJsMap = ->
  window.geopoint_search_map($("#gmaps_location_address"))
  $("#geopoint_search_box_container input").keypress (e) ->
    if e.keyCode == 13 # enter
      window.geopoint_search_map($(@))

  zoom = $('.data-location').data('zoom')
  if $("#gmaps_location_address").val() == ""
    zoom = 11
  opts =
    center: new google.maps.LatLng($('.data-location').data('latitude'), $('.data-location').data('longitude'))
    zoom: zoom
    mapTypeId: google.maps.MapTypeId.ROADMAP


  window.gmaps_map = new google.maps.Map(document.getElementById("map_canvas"), opts)
  window.gmaps_marker = new google.maps.Marker({position: opts.center, draggable: true})
  window.gmaps_info_window = new google.maps.InfoWindow({})
  window.gmaps_map.setCenter(window.gmaps_marker.getPosition(), 16)
  window.gmaps_info_window.close()
  window.gmaps_marker.setMap(window.gmaps_map)
  if $("#gmaps_map_allow").attr('value') == "point"
    google.maps.event.addListener window.gmaps_marker, "click", (event) ->
      latlng = event.latLng
      window.geopoint_handle(latlng)

window.mapResize = ->
  google.maps.event.trigger(window.gmaps_map, "resize");

window.geopoint_search_map = (dom) ->
  addressField = $(dom)
  geocoder = new google.maps.Geocoder()
  geocoder.geocode {address: addressField.val()}, (results, status) ->
    if status == google.maps.GeocoderStatus.OK
      loc = results[0].geometry.location
      window.gmaps_marker.setPosition(loc)
      window.gmaps_map.setCenter(window.gmaps_marker.getPosition(), 16)
      point = loc
      window.geopoint_handle(point)

window.geopoint_handle = (attr)->
  $("#gmaps_location_latitude").val(attr.lat())
  $("#gmaps_location_longitude").val(attr.lng())
  window.gmaps_marker.setPosition(attr)
  geocoder = new google.maps.Geocoder()
  if $("#gmaps_map_allow").attr('value') == "point"
    window.gmaps_info_window.open(window.gmaps_map, window.gmaps_marker)
  else

  window.gmaps_info_window.setContent("Loading...")
  geocoder.geocode {'latLng': attr}, (results, status) ->
    if status == google.maps.GeocoderStatus.OK
      if results[1]
        window.gmaps_info_window.setContent(results[0].formatted_address)
        $("#gmaps_location_address").val(results[0].formatted_address)
