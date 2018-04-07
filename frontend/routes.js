import weather from './components/weather.vue';
import signIn from './components/signIn.vue';
import signUp from './components/signUp.vue';
import signOut from './components/signOut.vue';

export default [
  { path: '/', component: weather },
  { path: '/weather', component: weather },
  { path: '/sign-in', component: signIn },
  { path: '/sign-up', component: signUp },
  { path: '/sign-out', component: signOut }
]
