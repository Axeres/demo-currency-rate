<template lang="pug">

.select-wrapper(v-out-click = "{ if: () => showOption, callback: () => showOption = false }")

  .label(v-if = "placeholder"
              :class = "{ 'active': showOption}") {{ placeholder }}

  .input(@click = "actionShowOptions()"
         :class = "{ 'disabled': disabled, 'active': showOption}"
         v-labelInput = "valueItem")

    .value {{ valueItem }}

  .select-options.scrollbar(v-show = "showOption" )
    .option(v-for = "item, i in options" @click = "selectedOption(i)"
            :key = "i"
            :class = "{ 'active': i == value}")

      | {{ item }}

</template>

<script lang="coffee">

# В компонент список передается в формате:
#  Объект ключ значение - { 'yes': 'Да', 'no': 'Нет' }

export default Vue.component 'v-select',

  props: [
    'options'
    'value'
    'default'
    'placeholder'
    'disabled'
  ]

  data: ->
    showOption: false
    selected: null

  created: ->
    @selected = @options?[0]

  mounted: ->
    if @default isnt false and not @value
      for item of @options
        @selectedOption(item)
        break

  methods:
    selectedOption: (item) ->
      @$emit('input', item)
      @val = item

      @showOption = false

    actionShowOptions: ->
      @showOption = !@showOption if not @disabled

  computed:
    valueItem: ->
      return @options[@value] if @value
      return 0




</script>

<style lang="sass">

// changes have butterfly effect to select Multiple component

.select-wrapper
  position: relative
  width: 100%
  margin-top: 1.7rem
  margin-bottom: 1rem
  height: 2.3rem

  .label
    position: absolute
    bottom: .7rem
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

  .input
    position: relative
    margin-bottom: 1rem
    background: transparent
    border-bottom: 1px solid $input-color-light_5
    height: fit-content
    padding: .3rem 1rem
    height: 2rem
    cursor: pointer

    &:after
      border-bottom: 2px solid $input-color-light_3
      border-right: 2px solid $input-color-light_3
      content: ''
      display: block
      height: 5px
      margin-top: -4px
      pointer-events: none
      position: absolute
      right: 12px
      top: 50%
      transform-origin: 66% 66%
      transform: rotate(45deg)
      transition: all 0.15s ease-in-out
      width: 5px

    &.active
      &:after
        transform: rotate(-135deg)

    .value
      transition: all ease-in-out .3s
      z-index: 1
      font-size: 1rem
      color: $grey-text
      white-space: nowrap
      overflow: hidden
      margin-right: 1rem


    &.selected
      font-weight: 500 !important
      color: #211C24 !important

    &.disabled
      background: darken(#EDF5F6, 10%)

  .select-options
    position: absolute
    top: 2.3rem
    left: 0
    width: 100%
    max-height: 20rem
    border: 1px solid lighten($input-color-light_5, 10%)
    background: #fff
    z-index: 1000
    overflow: hidden
    overflow-y: auto
    box-shadow: 0px 1px 3px lighten($input-color-light_5, 10%)

    .option
      display: flex
      position: relative
      padding: .5rem 1rem
      cursor: pointer
      border-bottom: 1px solid $input-color-light_5

      &.active
        background-color: lighten($input-color-light_5, 10%)

      &:last-child
        border-bottom: none

      &:hover
        background-color: lighten($input-color-light_5, 12%)
        color: #222

</style>

