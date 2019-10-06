<template lang="pug">

.table-rates

  .rate(v-for = "rate, key of rates")
    span.icon.flag-icon(:class = "'flag-icon-' + key.substr(0,2).toLowerCase()")
    .key  {{ key }}
    .value {{ rate }}


</template>

<script lang="coffee">


export default Vue.component 'table-rates',

  props: [
    'rates'
  ]

  data:
    test: 'asd'



</script>

<style lang="sass" scoped>

.table-rates
  width: 50%
  display: flex
  flex-direction: column
  align-items: center

  @media screen and (max-width: 800px)
      width: 80%

  @media screen and (max-width: 500px)
    width: 98%
    justify-content: center

  .rate
    display: flex
    justify-content: center
    width: inherit
    border-bottom: 1px solid $main-color-light_5

    .icon
      font-size:  1.3rem

    .key,
    .value
      padding: .5rem 1rem

    .key
      width: 30%

    .value
      width: 50%

</style>
