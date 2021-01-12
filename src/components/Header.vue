<template>
  <header class="header">
    <Container>
      <h1 class="header__title">To-Do List</h1>
    </Container>
  </header>
</template>

<script>
import Container from "./Container.vue";
export default {
  name: "Header",
  components: {
    Container,
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.header {
  height: 100px;
  background-color: #000;
  padding: 20px;
}
.header__title {
  color: #fff;
  font-size: 44px;
  margin: 0;
}
</style>
