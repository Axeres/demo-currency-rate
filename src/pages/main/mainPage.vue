<template lang="pug">

.main-page
  h1 elements
  .button test
  .button.success test
  .button.danger test

  x-input(placeholderActive = "Name field")

</template>

<script lang="coffee">

export default Vue.extend {}

</script>

<style lang="sass" scoped>

.main-page
  display: flex
  align-items: center
  flex-direction: column
  justify-content: center
  height: calc(100% - #{$heightHeader})

  & > div
    margin-bottom: 1rem


</style>
