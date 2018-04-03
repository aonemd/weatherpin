<template>
  <div>
    <weather-widget></weather-widget>
  </div>
</template>

<script>
import weatherWidget from './components/weatherWidget.vue'

export default {
  components: {
    'weather-widget': weatherWidget
  }
}
</script>

<style>
@import "normalize.css/normalize.css";

@import "stylesheets/grid.css";
@import "stylesheets/typography.css";
@import "stylesheets/utils.css";
</style>
