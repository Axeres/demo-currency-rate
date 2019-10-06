<template lang="pug">

.input-wrapper
  .label {{ placeholderActive }}
  input.input(v-model = "localValue"
              v-labelInput = "value"
              :placeholder = "placeholder"
              :disabled = "disabled"
              :id = "id")

  .description {{ description }}

  .validate-message-block


</template>

<script lang="coffee">

import Vue from 'vue'

export default Vue.component 'x-input', {
  props: [
    'id'
    'value'
    'placeholder'
    'placeholderActive'
    'description'
    'disabled'
  ]

  data: ->
    localValue: @value

  watch:
    value: (newValue) ->
      @localValue = newValue

    localValue: (newValue) ->
      @$emit 'input', newValue

}

</script>

<style lang="sass" scoped>

.input-wrapper
  position: relative
  margin-top: 1.7rem
  margin-bottom: 1rem
  background: transparent
  border-bottom: 1px solid $input-color-light_5
  height: 2.3rem

  .input
    position: relative
    z-index: 2
    width: 100%
    height: 2rem
    margin: 0px
    border: 1px solid transparent
    font-style: normal
    font-size: 1rem
    font-weight: 500
    padding: 0 1rem
    display: block
    outline: none
    background-color: transparent
    height: 2rem

    &:disabled
      color: #888
      background-color: rgba(200,200,200, .2)

    &::placeholder
      font-weight: 300
      font-size: 15px
      color: #707589


  .label
    position: absolute
    bottom: .3rem
    left: 1rem
    transition: all ease-in-out .3s
    z-index: 1
    font-size: 1rem
    color: $grey-text

    &.active,
    &.value
      bottom: 2.2rem
      left: .8rem
      font-size: .8rem

    &.active
      color: $input-color-light_3

    &::first-letter
      text-transform: uppercase


  .description
    position: absolute
    bottom: -1.1rem
    width: 100%
    font-size: .8rem
    color: #555
    text-align: right

    .validate-message-block-text
      color: $danger


  .btn-show-password
    position: absolute
    right: 10px
    top: 10px
    z-index: 10
    width: 30px
    height: 20px
    /*background-image: url('/img/icons/showPassClose.svg')*/
    background-repeat: no-repeat
    background-position: center center
    background-size: cover
    &:hover
      cursor: pointer

  .open
    /*background-image: url('/img/icons/showPassOpen.svg')*/

  &.success-validation
    border-bottom: 1px solid $success

    .label
      color: $success

.validation
  .input-wrapper
    &.error-validation
      border-bottom: 1px solid $danger

      .label
        color: $danger

      .description
        display: none

      .validate-message-block
        position: absolute
        bottom: -1.1rem
        width: 100%
        font-size: .8rem
        text-align: right

        color: $danger




</style>

