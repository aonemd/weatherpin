<template>
  <div id="sign-in">
    <div id="sign-in__main-la">
      <div class="row">
        <div class="center">
          <div class="col-12 text-center">
            <h1>
              Sign In
            </h1>
          </div>
        </div>
      </div>
    </div>

    <div class="sign-in__controls">
      <div class="row">
        <div class="center">
          <div class="col-12 text-center">
            <input type="text" placeholder="Email or Username" id="sign-in__identity" v-model="identity">
            <input type="password" placeholder="Password" id="sign-in__password" v-model="password">
            <button id="sign-in__button" v-on:click="submit">Sign in</button>
          </div>
        </div>
      </div>
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
#sign-in__main-label {
  padding-top: 100px;
}
.sign-in__controls input {
  margin-right: 10px;
}
</style>
