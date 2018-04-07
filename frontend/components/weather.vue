<template>
  <div>
    <weather-widget class="separator" v-bind:authenticated="authenticated"></weather-widget>
    <posts v-show="authenticated" v-bind:authenticated="authenticated"></posts>
  </div>
</template>

<script>
import weatherWidget from './weatherWidget.vue';
import posts from './posts.vue';
import secured from 'services/secured';

export default {
  components: {
    'weather-widget': weatherWidget,
    'posts': posts
  },
  data () {
    return {
      authenticated: false
    }
  },
  created () {
    this.authenticated = secured.authenticated();
  }
}
</script>

<style scoped>
.separator {
  margin-bottom: 50px;
}
</style>
