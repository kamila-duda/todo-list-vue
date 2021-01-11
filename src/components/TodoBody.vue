<template>
  <main class="">
      {{newTask}}
    <input type="text" placeholder="Type what to do..." v-model="newTask" />
    <button @click="alert">Dodaj</button>
    <ul v-for="task in tasks" v-bind:key="task.id">
      <li>{{ task.title }}</li>
    </ul>
  </main>
</template>

<script>
export default {
  data() {
    return {
      newTask:null,
      tasks: [
        { id: 1, title: "Learn to Vue.js", done: false },
        { id: 2, title: "Learn to React Native", done: false },
      ],
    };
  },
  methods: {
    alert(){alert(this.newTask)}
    // addTask() {
    //   tasks.push({ id: Math.random(), title: newTask, done: false });
    // },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
