<template>
  <div>
    <h1>
      Sign In
    </h1>

    <div id="sign-in__input-group">
      <input type="text" placeholder="Email or Username" v-model="identity">
      <br>
      <input type="password" placeholder="Password" v-model="password">
      <br>
      <button v-on:click="submit">Sign in</button>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      identity: '',
      password: '',
      errors: []
    }
  },
  methods: {
    submit: function () {
      this.$http.post('/api/v1/sign_in.json', { identity: this.identity, password: this.password })
        .then(function(response) {
          localStorage.setItem('token', response.body.token);
          this.$router.push('/');
          location.reload();
        },
          function(response) {
            this.errors = response.body.errors;
            console.log(this.errors)
          }
        )
    }
  }
}
</script>

<style scoped>
#sign-in__input-group input, button {
  margin-bottom: 15px;
}
</style>
