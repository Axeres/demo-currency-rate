<template lang="pug">

.header
  .logo
    include ../../assets/logo.svg

  .links
    router-link.link.main(:to = "{ name: 'mainPage' }") Task
    router-link.link.main(:to = "{ name: 'contacts' }") Contacts

</template>

<script lang="coffee">

export default Vue.extend {


}

</script>

<style lang="sass" scoped>

.header
  display: flex
  flex-wrap: wrap
  align-items: center
  padding: .5rem 2rem
  background-color: $main-color
  min-height: $heightHeader

  @media screen and (max-width: 500px)
    justify-content: center

  .logo
    margin-top: 5px
    margin-right: 2rem

    svg
      width: 12rem


  .links
    display: flex
    flex-direction: row

    .link
      margin-right: 1.5rem
      cursor: pointer
      color: #fff

      &:hover
        text-decoration: underline


</style>
