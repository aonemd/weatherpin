import "./weather-widget.css"

import Vue from 'vue/dist/vue.esm'
import VueResource from 'vue-resource'

Vue.use(VueResource)

document.addEventListener('DOMContentLoaded', () => {
  Vue.http.interceptors.push({
    request: function (request) {
      Vue.http.headers.common['X-CSRF-Token'] = $('[name="csrf-token"]').attr('content');
      return request;
    },
    response: function (response) {
      return response;
    }
  });

  var vm = new Vue({
    el: '#weather-widget',
    data: {
      temperature: "Weatherpin",
      placeName: '',
      cityName: '',
      countryCode: '',
      latitude: '',
      longitude: ''
    },
    methods: {
      getWeatherByLocation: function () {
        var that = this;
        navigator.geolocation.getCurrentPosition(
          (position) => {
            that.latitude  = position.coords.latitude;
            that.longitude = position.coords.longitude;
            that.$http.get('/api/v1/current/by_coord.json',
              {params: {lat: that.latitude, lon: that.longitude}})
              .then(
                function(response) {
                  that.temperature = response.data.temperature + "'C";
                  that.placeName   = response.data.place_name
                  that.cityName    = ''
                  that.countryCode = ''
                },
                function(response) {
                  that.temperature = response.data.errors;
                }
              )
          }
        );
      },
      getWeather: function () {
        this.$http.get('/api/v1/current/by_city.json', { params: { city: this.cityName, country: this.countryCode } })
          .then(
            function(response) {
              this.temperature = response.data.temperature + "'C";
              this.placeName   = response.data.place_name
              this.cityName    = ''
              this.countryCode = ''
            },
            function(response) {
              this.temperature = response.data.errors;
            }
          )
      },
      randomWeather: function () {
        this.$http.get('/api/v1/random.json')
          .then(
            function(response) {
              this.temperature = response.data.temperature + "'C";
              this.placeName   = response.data.place_name
              if (this.placeName === '') {
                this.placeName = "Nobody Lives Here"
              }
            },
            function(response) {
              this.temperature = response.data.errors;
            }
          )
      }
    }
  })
})
