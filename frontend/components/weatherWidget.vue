<template>
  <div>
    <h1>
      {{temperature}}
      <small>{{location}}</small>
    </h1>

    <div id="weather-widget__input-group">
      <input type="text" placeholder="City" v-model="cityName">
      <input type="text" placeholder="Country Code" v-model="countryCode">
    </div>

    <div id="weather-widget__button-group">
      <button v-on:click="getWeatherByLocation">➤</button>
      <button v-on:click="getWeather">Get Weather</button>
      <button v-on:click="randomWeather">Feeling Lucky?</button>
    </div>
    <br>
    <button v-show="authenticated" v-on:click="addPost">Share</button>
  </div>
</template>

<script>
import { bus } from '../packs/application';

export default {
  props: ['authenticated'],
  data () {
    return {
      temperature: "Weatherpin",
      location: '',
      cityName: '',
      countryCode: '',
      latitude: '',
      longitude: ''
    }
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
                that.location   = response.data.place_name
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
            this.location   = response.data.place_name
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
            this.location   = response.data.place_name
            if (this.location === '') {
              this.location = "Nobody Lives Here"
            }
          },
          function(response) {
            this.temperature = response.data.errors;
          }
        )
    },
    addPost: function () {
      let token = localStorage.getItem('token');
      this.$http.post('/api/v1/posts.json',
        { post: { temperature: this.temperature, location_name: this.location } },
        { headers: { 'Authorization': "Bearer " + token  } })
        .then(function(response) {
          bus.$emit('addPost', response.body.post);
        });
    }
  }
}
</script>

<style scoped>
#weather-widget__input-group {
  display: inline-block;
}

#weather-widget__input-group input {
  margin-right: 10px;
  margin-bottom: 15px;
}

#weather-widget__button-group {
  display: block;
}

#weather-widget__button-group button {
  margin-right: 10px;
}
</style>
