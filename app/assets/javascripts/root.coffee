# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#Vue.config.debug = true
new Vue(
  el: '#app'
  data: {
    place:     null
    latitude:  null
    longitude: null
  }
  methods: {
    submit: (e) ->
      # console.log @$data
      # e.preventDefault()
    getGeo: (e) ->
      e.preventDefault()
      vm = @
      navigator.geolocation.getCurrentPosition(
        (position) ->
          coords = position.coords
          vm.latitude  = lat = coords.latitude
          vm.longitude = lng = coords.longitude
          console.log [lat, lng]
          geocoder = new google.maps.Geocoder()
          latlng = new google.maps.LatLng(lat, lng)
          geocoder.geocode {'latLng': latlng}, (results, status) ->
            vm.place = results[0].formatted_address
        ,
        () ->
          alert 'error'
      )
      
  }
)