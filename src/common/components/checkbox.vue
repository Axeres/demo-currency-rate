<template lang="pug">

.check-box(@click="checked = !checked")
  .wrapper-checkbox
    .checkbox
      .check(v-if = "checked")
  slot

</template>

<script lang="coffee">

  export default Vue.component 'checkbox', {
    props: [
      'value'
    ]

    computed:
      checked:
        get: -> @value
        set: (newValue) -> @$emit('input', newValue)

  }

</script>

<style lang="sass" scoped>


.check-box
  display: flex
  flex-direction: row
  cursor: pointer
  align-items: center

  .wrapper-checkbox
    position: relative
    width: 1.5rem
    height: 1.5rem
    margin-right: .5rem
    border-radius: 3px

    .checkbox
      position: relative
      border: 1px solid #888
      width: 1.3rem
      height: 1.3rem
      padding: .2rem
      border-radius: 3px

      .check
        width: 100%
        height: 100%

        background: $input-color-light_3

.green
  .check


.alfa-insurance .checkbox
  white-space: normal

</style>

