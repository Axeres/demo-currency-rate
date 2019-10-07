<template lang="pug">

.main-page(v-if = "!$store.state.loading" )

  .filter-block
    v-select.form-element( v-model = "baseRate"
                          :options = "availableRates"
                          placeholder = "Base rate")

    select-multiple.form-element(v-model = "filterRates"
                                :options = "availableRates"
                                placeholder = "Filter rates")

    el-date-picker.form-element(v-model = "$store.state.selectedDate"
                                type="date"
                                placeholder="Pick a day"
                                format = "yyyy-MM-dd"
                                :picker-options="pickerOptions"
                                :change = "setDate()")

  table-rates(v-if = "$store.getters.visibleRates"
              :rates = "$store.getters.visibleRates")

</template>

<script lang="coffee">

export default Vue.extend {

  data: ->
    baseRate: @$store.state.defaultBaseRate
    filterRates: @$store.state.filterRates
    availableRates: @$store.state.availableRates

    pickerOptions:
      disabledDate: (time) ->
        return true if time.getFullYear() < 1999
        return true if time.getDay() is 0 or time.getDay() is 6
        return true if time.getTime() > Date.now();

      firstDayOfWeek: 1

  watch:
    baseRate: (newVal) ->
      @$store.dispatch('setNewRate', newVal)

  methods:
    setDate: ->
      return if not @$store.state.selectedDate
      formatedDate = moment(@$store.state.selectedDate).format('YYYY-MM-DD')
      @$store.dispatch('setNewDate', formatedDate)

}

</script>

<style lang="sass" scoped>

.main-page
  display: flex
  align-items: center
  flex-direction: column

  & > div
    margin-bottom: 1rem

  .filter-block
    display: flex
    flex-wrap: wrap
    justify-content: space-between
    width: 60%
    margin-top: 2rem
    margin-bottom: 2rem

    @media screen and (max-width: 1280px)
      width: 80%

    @media screen and (max-width: 800px)
      width: 98%
      justify-content: center

    .form-element
      width: 30%
      min-width: 200px

      @media screen and (max-width: 800px)
        margin-left: 1rem
        margin-right: 1rem
        min-width: 300px


</style>
