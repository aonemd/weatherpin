import weatherWidget from './components/weatherWidget.vue';
import signIn from './components/signIn.vue';
import signUp from './components/signUp.vue';

export default [
  { path: '/', component: weatherWidget },
  { path: '/weather', component: weatherWidget },
  { path: '/sign-in', component: signIn },
  { path: '/sign-up', component: signUp }
]
