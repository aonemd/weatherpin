<template>
  <div>
    <div v-for="post in posts">
      <div class="post">
        <p>@{{ post.username }} . {{ post.created_at }}</p>
        <h1>
          {{ post.temperature }}
          <small>{{ post.location_name }}</small>
        </h1>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['authenticated'],
  data () {
    return {
      posts: []
    }
  },
  created () {
    if (this.authenticated) {
      let token = localStorage.getItem('token');
      this.$http.get('/api/v1/posts.json', { headers: { 'Authorization': "Bearer " + token } })
        .then(function(response) {
          this.posts = response.body.posts;
        });
    }
  }
}
</script>

<style scoped>
.post {
  background: #eee;
  margin: 10px auto;
  padding: 2px;
  width: 500px;
  height: 200px;
  text-align: center;
}
</style>
