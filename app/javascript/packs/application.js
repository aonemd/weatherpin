/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

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
    el: '#app',
    data: {
      temperature: "Weatherpin",
      placeName: '',
      cityName: '',
      countryCode: ''
    },
    methods: {
      getWeather: function () {
        this.$http.get('/current.json', { params: { city: this.cityName, country: this.countryCode } })
          .then(
            function(response) {
              this.temperature = response.data.temperature + "'C";
              this.placeName   = response.data.place_name
            },
            function(response) {
              this.temperature = response.data.errors;
            }
          )
      },
      randomWeather: function () {
        this.$http.get('/random.json')
          .then(
            function(response) {
              this.temperature = response.data.temperature + "'C";
              this.placeName   = response.data.place_name
            },
            function(response) {
              this.temperature = response.data.errors;
            }
          )
      }
    }
  })
})
