import Vue from 'vue'
import Vuex from 'vuex'
import router from '../router/router.coffee'

Vue.use(Vuex)

export default new Vuex.Store

  state:
    loading: false

  actions:
    init: ({ state }) ->

      axios.get 'https://api.ratesapi.io/api/latest?symbols=USD,GBP'
        .then (response) =>
          console.log response.data

