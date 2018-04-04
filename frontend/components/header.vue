<template>
  <nav>
    <ul>
      <li><router-link to="/" exact>Home</router-link></li>
      <li><router-link to="/sign-in" exact>Sign In</router-link></li>
      <li><router-link to="/sign-up" exact>Sign Up</router-link></li>
    </ul>
  </nav>
</template>

<script>
export default {}
</script>

<style>
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
  border-radius: 10px;
}
nav {
  padding: 14px 0;
  margin-bottom: 40px;
}
.router-link-active {
  background: #eee;
  color: #444;
}
</style>
