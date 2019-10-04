import Vue from 'vue'

Vue.directive 'out-scroll',
  bind: (el, binding) ->

    el.hideElement = (event) ->

      return if _.isFunction(binding.value?.if) and not binding.value.if()

      target = $(event.target)

      if target.closest(el).length is 0
        if _.isFunction binding.value
          binding.value()
        else
          binding.value.callback()

      return

    $(document).on('scroll', el.hideElement)

  unbind: (el, binding) ->
    $(document).off('scroll', el.hideElement)
    delete el.hideElement