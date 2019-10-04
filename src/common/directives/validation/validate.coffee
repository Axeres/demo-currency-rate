import Vue from 'vue'
import errorsMessage from './errorMessage.coffee'

$body = $('body')

Vue.directive 'validate',
  bind: (el, binding, vnode) ->

    return if not binding.value

    message = null
    messageBlock = null

    removeMessage = ->
      messageBlock?.remove()
      messageBlock = null


    showMessage = ->
      removeMessage()

      $v = binding.value?.$v or binding.value

      return if not $v.$invalid or not $(el).closest('.validation').length

      validateKey = _($v.$flattenParams())
        .map (item) -> item.name
        .filter (key) -> not $v[key]
        .first()

      message = errorsMessage[validateKey]

      messageBlock = $("<div class = 'validate-message-block-text'>#{message}</div>")


      $(el).find('.validate-message-block').html messageBlock


    el.validateUnwatch = vnode.context.$watch ->
      if binding.value?.$v
        model: binding.value.$v.$model
        dirty: binding.value.$v.$dirty
        watch: binding.value.watch
      else
        model: binding.value.$model
        dirty: binding.value.$dirty
    ,  ->
      $v = binding.value?.$v or binding.value


      return $v.$touch() if not $v.$dirty

      setTimeout ( ->
        if $v.$error
          $(el).removeClass 'success-validation'
          $(el).addClass 'error-validation'
          showMessage()
        else
          $(el).removeClass 'error-validation'
          $(el).addClass 'success-validation'
          removeMessage()
      ), 200

    , { immediate: true, deep: true }


    # Добавляем сообщение при фокусе или снятии его с input
    focusOrBlur = (event) ->
#      removeMessage()

      $v = binding.value?.$v or binding.value

      if event.type is 'focus' and $v.$dirty
        showMessage(event)

    $(el).children('input').on 'focus blur', focusOrBlur

    el.unbindEvents = ->
      $(el).children('input').off 'focus blur', focusOrBlur
      removeMessage()


  unbind: (el) ->
    el.unbindEvents?()
    el.validateUnwatch?()
    el.unbindEvents = el.validateUnwatch = null