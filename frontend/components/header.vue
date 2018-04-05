<template>
  <nav>
    <ul>
      <li><router-link to="/" exact>Home</router-link></li>
      <li v-show="!authenticated"><router-link to="/sign-in" exact>Sign In</router-link></li>
      <li v-show="!authenticated"><router-link to="/sign-up" exact>Sign Up</router-link></li>
      <li v-show="authenticated">{{ username }}</li>
      <li v-show="authenticated"><router-link to="/sign-out" exact>Sign Out</router-link></li>
    </ul>
  </nav>
</template>

<script>
import jwtDecoder from 'services/jwtDecoder';

export default {
  data () {
    return {
      authenticated: false,
      username: ''
    }
  },
  created () {
    let payload = jwtDecoder.payload();
    if (payload != null) {
      this.authenticated = (payload['user_id'] != null);
      this.username      = payload['username'];
    }
  }
}
</script>

<style scoped>
nav {
  padding: 14px 0;
  margin-bottom: 40px;
}

ul {
  list-style-type: none;
  text-align: center;
  margin: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  text-decoration: none;
  padding: 6px 8px;
  border-radius: 4px;
}

a:visited {
  color: #444;
}

.router-link-active {
  background: #eee;
  color: #444;
}
</style>
