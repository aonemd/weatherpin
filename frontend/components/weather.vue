<template>
  <div>
    <weather-widget></weather-widget>
  </div>
</template>

<script>
import weatherWidget from './weatherWidget.vue';

export default {
  components: {
    'weather-widget': weatherWidget
  }
}
</script>

<style>
</style>
