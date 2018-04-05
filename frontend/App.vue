<template>
  <div>
    <app-header></app-header>
    <div id="container">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import header from 'components/header.vue';

export default {
  components: {
    'app-header': header
  }
}
</script>

<style>
@import "normalize.css/normalize.css";

@import "stylesheets/grid.css";
@import "stylesheets/typography.css";
@import "stylesheets/utils.css";

#container {
  margin: 100px auto;
  text-align: center;
}
</style>
