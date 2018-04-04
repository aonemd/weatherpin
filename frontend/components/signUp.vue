<template>
  <div id="sign-up">
    <div id="sign-up__main-la">
      <div class="row">
        <div class="center">
          <div class="col-12 text-center">
            <h1>
              Sign Up
            </h1>
          </div>
        </div>
      </div>
    </div>

    <div class="sign-up__controls">
      <div class="row">
        <div class="center">
          <div class="col-12 text-center">
            <input type="text" placeholder="Email" id="sign-up__email" v-model="email">
            <input type="text" placeholder="Username" id="sign-up__username" v-model="username">
            <input type="password" placeholder="Password" id="sign-up__password" v-model="password">
            <button id="sign-up__button" v-on:click="submit">Sign up</button>
          </div>
        </div>
      </div>
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
#sign-up__main-label {
  padding-top: 100px;
}
.sign-up__controls input {
  margin-right: 10px;
}
</style>
