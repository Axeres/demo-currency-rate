<template lang="pug">

.contacts
  .wrapper

    .fio
      span name:
      | Viktor Popov

    .phone
      span phone:
      | +7 (999) 633-11-77

      span (Telegram)

    .phone
      span skype:
      | axeres

    .gitHub
      span gitHub:
      a(href = "https://github.com/axeres" target = "_blank") axeres

    .moikrug
      span moikrug.ru :
      a(href = "https://moikrug.ru/axeres" target = "_blank") axeres


</template>

<script lang="coffee">

export default Vue.extend {


}

</script>

<style lang="sass" scoped>

.contacts
  display: flex
  align-items: center
  flex-direction: column
  margin-top: 4rem

  .wrapper
    width: 30%
    padding: 2rem 2rem
    border: 1px solid $main-color
    border-radius: 10px
    box-shadow: 0 1px 10px rgba(100, 100, 100, .2)

    @media screen and (max-width: 1280px)
      width: 60%

    @media screen and (max-width: 800px)
      width: 98%
      justify-content: center

    div
      font-weight: 400

      span
        margin: 0 .5rem
        font-weight: 500



</style>
