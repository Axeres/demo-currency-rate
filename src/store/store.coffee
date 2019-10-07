import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store

  state:
    loading: false

    defaultBaseRate: 'RUB'
    latestDate: null
    selectedDate: null
    selectedRate: null

    availableRates: []
    rates: []
    filterRates: []


  mutations:

    loadingStart: (state) ->
      state.loading = true

    loadingEnd: (state) ->
      state.loading = false

    rates: (state, rates) ->
      state.rates.push rates

    selectedDate: (state, newDate) ->
      state.selectedDate = newDate

    selectedRate: (state, newBaseRate) ->
      state.selectedRate = newBaseRate

    addAvailableRates: (state, availableRate) ->
      state.availableRates.push availableRate


  getters:

    selectedRates: (state, getters) ->
      date = if state.selectedDate then state.selectedDate else state.latestDate
      baseRate = if state.selectedRate then state.selectedRate else state.defaultBaseRate

      return _.find state.rates, { 'date': date, 'base': baseRate }


    visibleRates: (state, getters) ->
      return _(getters.selectedRates.rates)
        .map (rate, currency) -> return { currency: currency, rate: rate }
        .filter (rate) ->
          return true if not state.filterRates.length
          return state.filterRates.includes rate.currency
        .value()


  actions:

    init: ({ state, commit, getters, dispatch }) ->
      commit 'loadingStart'

      dispatch 'getRate'
        .then (res) =>

          state.latestDate = res?.date
          state.selectedDate = res?.date

          for rate of res?.rates
            commit 'addAvailableRates', rate

        .finally ->
          commit 'loadingEnd'


    getRate: ({ state, commit, dispatch }) ->
      date = if state.selectedDate then state.selectedDate else 'latest'
      baseRate = if state.selectedRate then state.selectedRate else state.defaultBaseRate

      axios.get 'https://api.ratesapi.io/api/' + date + '?base=' + baseRate
        .then (response) ->

          commit 'rates', response.data

          Vue.notify
            type: 'success'
            title: 'Successful',
            text: 'Rate Loading on ' + response.data.date

          return response.data

        .catch (e) ->
          console.log e


    setNewDate: ({ state, dispatch, getters, commit }, newDate) ->
      commit 'selectedDate', newDate
      return if getters.selectedRates

      commit 'loadingStart'

      dispatch 'getRate'
        .then (response) ->
          commit 'selectedDate', response.date

        .finally =>
          commit 'loadingEnd'


    setNewRate: ({ dispatch, getters, commit }, newRate) ->
      commit 'selectedRate', newRate
      return if getters.selectedRates

      commit 'loadingStart'

      dispatch 'getRate'
        .finally =>
          commit 'loadingEnd'

