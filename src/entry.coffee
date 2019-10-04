require './config.coffee'
require './styles/main.sass'

import { sync } from 'vuex-router-sync'
import router from './router/router.coffee'
import store from './store/store.coffee'

sync(store, router)

Vue.config.productionTip = false;
Vue.config.devtools = true;

app = new Vue({
  router
  store
}).$mount('#app');
