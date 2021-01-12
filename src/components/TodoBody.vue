<template>
  <main>
    <TaskInput
      class="taskInput__container"
      @addedTask="addTask"
      v-bind:newTask="newTask"
    />
    <Container>
      <TasksItems
        class="taskList"
        v-bind:tasks="tasks"
        @removeClicked="removeTask"
        @toggleDone="toggleDone"
      />
    </Container>
  </main>
</template>

<script>
import Container from "./Container.vue";
import TaskInput from "./TaskInput.vue";
import TasksItems from "./TasksItems.vue";

export default {
  components: {
    TaskInput,
    TasksItems,
    Container,
  },
  data() {
    return {
      newTask: null,
      tasks: [
        { id: 1, title: "Learn to Vue.js", done: true },
        { id: 2, title: "Learn to React Native", done: false },
      ],
      nextTaskId: 3,
    };
  },
  methods: {
    addTask(newTask) {
      this.tasks.push({
        id: this.nextTaskId++,
        title: newTask,
        done: false,
      });
    },
    removeTask(id) {
      const index = this.tasks.findIndex((el) => el.id === id);
      this.tasks.splice(index, 1);
    },
    toggleDone(id) {
      const index = this.tasks.findIndex((el) => el.id === id);
      if (this.tasks[index].done) {
        this.tasks[index].done = false;
      } else {
        this.tasks[index].done = true;
      }
    },
    focusInput() {
      this.$refs.taskInput.focus();
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.taskInput__container {
  background-color: #000;
}
.taskList {
  list-style: none;
  padding: 0;
}
</style>
