<template lang="pug">

.select-wrapper(v-out-click = "{ if: () => showOptions, callback: () => showOptions = false }")

  .label(v-if = "placeholder"
              :class = "{ 'active': showOptions}") {{ placeholder }}

  .input(@click = "actionShowOptions()"
        :class = "{ 'disabled': disabled, 'active': showOptions}"
        @mouseover = "previewSelected = true"
        @mouseleave = "previewSelected = false"
        v-labelInput = "itemsList")

    .value {{ itemsList }}

  .select-options.scrollbar(v-show = "showOptions" )
    .option(v-for = "item, i in items" @click = "toggleItem(item)"
            :key = "i"
            :class = "{ 'active': value.indexOf(item.id) !== -1 }")

      | {{ item.name }}

  .wrapper-preview-selected

  //.selected-list(v-if = "previewSelected")
      .selected(v-for = "selected of selectedList" @click = "toggleItem(selected)") {{ selected.name }}

</template>

<script lang="coffee">

export default Vue.component 'select-multiple', {
  props: [
    'value'
    'placeholder'
    'options'
    'selectedItems'
    'styles'
    'disabled'
  ]

  data: ->
    showOptions: false
    previewSelected: true

  methods:
    toggleItem: (item) ->
      if @value.indexOf(item.id) is -1
        @value.push(item.id)
      else
        @value.splice(@value.indexOf(item.id), 1)

    actionShowOptions: ->
      @showOptions = !@showOptions if not @disabled

  computed:
    itemsList: ->
      _(@value or [])
        .map (x) => @items.find((item) -> item.id is x)
        .filter (x) -> x
        .orderBy (x) -> x.name
        .map (x) -> x.name
        .value()
        .join ', '

    selectedList: ->
      _(@value or [])
        .map (x) => @items.find((item) -> item.id is x)
        .filter (x) -> x
        .value()

    items: ->
      if _.isArray(@options) or not _.isObject(@options)
        _(@options)
          .map (value) -> id: value, name: value
          .orderBy (x) -> x.name
          .value()

      else
        _.map @options, (value, key) -> id: key, name: value
        _(@options)
          .map (value) -> id: value, name: value
          .orderBy (x) -> x.name
          .value()

  watch:
    value: () ->
      @$emit('update:selectedItems', _(@value or [])
        .map (x) => @items.find((item) -> item.id is x)
        .filter (x) -> x
        .value()
      )
}

</script>

<style lang="sass" scoped>

.select-wrapper
  .input
    position: relative
    z-index: 1
    margin-bottom: 0

  .option
    padding-left: 2.5rem
    cursor: pointer

    &.active
      position: relative

      &:before
        content: ''
        position: absolute
        left: .9rem
        top: .75rem
        width: 1rem
        height: 1rem
        background-position: center
        background-size: contain
        background-repeat: no-repeat
        background-image: url('~/assets/icons/ok-green.svg')


  .selected-list
    padding: 0.3rem
    padding-top: 0
    background-color: #fff
    // border: 1px solid $input-color
    margin-top: .1rem
    box-shadow: 0px 2px 5px lighten($input-color-light_5, 10%)

    .selected
      display: inline-block
      position: relative
      font-size: 1rem
      background-color: $input-color
      color: #fff
      border-radius: 1rem
      padding: 0.25rem 0.75rem
      margin: 0.3rem 0.5rem 0 0
      cursor: pointer


</style>
