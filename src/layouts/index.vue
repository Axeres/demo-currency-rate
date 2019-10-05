<template lang = "pug">

.layout
  header-component

  router-view

  notifications(position="bottom right")

  .preloader(v-if = "$store.state.loading")

</template>

<script lang="coffee">

export default
  components:
    headerComponent: require('./header/header.vue').default

  created: ->
    # @$store.dispatch 'init'

</script>

<style lang="sass">

.layout
  width: 100%
  height: 1px
  min-height: 100vh

.preloader
  position: fixed
  z-index: 10000
  width: 100%
  height: 100vh
  top: 0
  left: 0
  background-color: rgba(0,0,0, .3)
  background-image: url("~assets/loader.gif")
  background-repeat: no-repeat
  background-position: center
  background-size: 80px

</style>
