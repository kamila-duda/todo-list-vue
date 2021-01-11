<template>
  <div id="app">
    <Header />
    <TodoBody />
  </div>
</template>

<script>
import Header from './components/Header.vue';
import TodoBody from './components/TodoBody.vue'

export default {
  name: 'App',
  components: {
    Header,
    TodoBody
  }
}
</script>

<style>

</style>
