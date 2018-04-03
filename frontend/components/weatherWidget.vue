<template>
  <div id="weather-widget">
    <div id="weather-widget__main-label">
      <div class="row">
        <div class="center">
          <div class="col-12 text-center">
            <h1>
              {{temperature}}
              <small>{{placeName}}</small>
            </h1>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="center">
        <div class="col-12 text-center">
          <input type="text" placeholder="City"         id="weather-widget__control" v-model="cityName">
          <input type="text" placeholder="Country Code" id="weather-widget__control" v-model="countryCode">
        </div>
        <div class="col-12 text-center">
          <button id="weather-widget__control" v-on:click="getWeatherByLocation">➤</button>
          <button id="weather-widget__control" v-on:click="getWeather">Get Weather</button>
          <button id="weather-widget__control" v-on:click="randomWeather">Feeling Lucky?</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  data () {
    return {
      temperature: "Weatherpin",
      placeName: '',
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
}
</script>

<style>
#weather-widget__main-label {
  padding-top: 100px;
}

#weather-widget__control {
  margin-right: 10px;
}
</style>
