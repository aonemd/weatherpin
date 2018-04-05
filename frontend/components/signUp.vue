<template>
  <div>
    <h1>
      Sign Up
    </h1>

    <div id="sign-up__input-group">
      <input type="text" placeholder="Email" id="sign-up__email" v-model="email">
      <br>
      <input type="text" placeholder="Username" id="sign-up__username" v-model="username">
      <br>
      <input type="password" placeholder="Password" id="sign-up__password" v-model="password">
      <br>
      <button id="sign-up__button" v-on:click="submit">Sign up</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: '',
      username: '',
      password: '',
      errors: []
    }
  },
  methods: {
    submit: function () {
      this.$http.post('/api/v1/sign_up.json', { email: this.email, username: this.username, password: this.password })
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
#sign-up__input-group input, button {
  margin-bottom: 15px;
}
</style>
