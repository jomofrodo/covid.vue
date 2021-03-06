import Vue from "vue";

import Admin from "./Admin.vue";
import router from "./router/admin";
import store from "./store";
import axios from 'axios';
// import './css/rwa.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/css/bootstrap-grid.min.css';
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
import 'vue-select/dist/vue-select.css';
import './css/covid.css';


// import { CHECK_AUTH } from "./store/actions.type";
// import ApiService from "./common/api.service";
// import DateFilter from "./common/date.filter";
// import ErrorFilter from "./common/error.filter";
Vue.prototype.$http = axios;
Vue.config.productionTip = false;
Vue.use(BootstrapVue);
Vue.use(IconsPlugin);
// Vue.filter("date", DateFilter);
// Vue.filter("error", ErrorFilter);
// Global registration
// ApiService.init();

// Ensure we checked auth before each page load.
// router.beforeEach((to, from, next) =>
//   Promise.all([store.dispatch(CHECK_AUTH)]).then(next)
// );

new Vue({
  router,
  store,
  render: h => h(Admin)
}).$mount("#app");
