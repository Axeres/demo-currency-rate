<template lang="pug">

.table-rates

  .rate(v-for = "rate, i in rates"
        :key = "i")

    span.icon.flag-icon(:class = "'flag-icon-' + rate.currency.substr(0,2).toLowerCase()")
    .currency  {{ rate.currency }}
    .currency-rate {{ rate.rate }}


</template>

<script lang="coffee">


export default Vue.component 'table-rates',

  props: [
    'rates'
  ]

  data: ->
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

    .currency,
    .currency-rate
      padding: .5rem 1rem

    .currency
      width: 30%

    .currency-rate
      width: 50%

</style>
