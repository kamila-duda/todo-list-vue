<template>
  <div class="header">
    <h1 class="header__title">To-Do List</h1>
  </div>
</template>

<script>
export default {
  name: 'Header',
  
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.header{
  height: 200px;
  background-color: #000;
}
.header__title{
  color: #fff;
  font-size: 36px;
  margin: 0;
}
</style>
