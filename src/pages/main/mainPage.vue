<template lang="pug">

.main-page(v-if = "!$store.state.loading" )

  h1 selectedDate = {{ $store.state.selectedDate }}
  h1 selectedRate = {{ $store.state.selectedRate }}

  .button(@click = "$store.dispatch('setNewDate', '2011-12-04')") setDate = 2011-12-04
  .button(@click = "$store.dispatch('setNewDate', '2012-12-04')") setDate = 2012-12-04
  .button(@click = "$store.dispatch('setNewDate', '2013-12-04')") setDate = 2013-12-04
  .button(@click = "$store.dispatch('setNewDate', '2014-12-04')") setDate = 2014-12-04
  .button(@click = "$store.dispatch('setNewDate', '2018-12-04')") setDate = 2018-12-04
  .button(@click = "$store.dispatch('setNewDate', '2019-12-04')") setDate = 2019-12-04

  .button(@click = "$store.dispatch('setNewRate', 'RUB')") setRate = RUB
  .button(@click = "$store.dispatch('setNewRate', 'USD')") setRate = USD

  h3 {{ $store.getters.filteredRates }}

  span.flag-icon.flag-icon-eu

</template>

<script lang="coffee">

export default Vue.extend {


}

</script>

<style lang="sass" scoped>

.main-page
  display: flex
  align-items: center
  flex-direction: column
  justify-content: center
  height: calc(100% - #{$heightHeader})

  & > div
    margin-bottom: 1rem


</style>
