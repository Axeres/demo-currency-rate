import Vue from 'vue'

Vue.directive 'labelInput',
  bind: (el, binding) ->
    el.repositionLabel = (event) ->
      $(el).parent().find('.label').addClass('active') if event.type is 'focusin'
      $(el).parent().find('.label').removeClass('active') if event.type is 'focusout'

    $(document).ready ->
      $(el).parent().find('.label').addClass('value') if binding.value or binding.value is 0
      $(el).parent().find('.label').removeClass('value') if !binding.value and binding.value isnt 0

    $(el).on('focusin focusout', el.repositionLabel)


  update: (el, binding) ->
    $(el).parent().find('.label').addClass('value') if binding.value
    $(el).parent().find('.label').removeClass('value') if !binding.value

  unbind: (el, binding) ->
    $(el).off('focusin focusout', el.repositionLabel)
    delete el.repositionLabel