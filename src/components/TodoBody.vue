<template>
  <main>
    <TaskInput
      class="taskInput__container"
      @addedTask="addTask"
      v-bind:newTask="newTask"
    />
    <Container>
      <ul class="taskList">
        <TaskItem
          v-for="(task, index) in tasks"
          v-bind:key="index"
          v-bind:task="task"
          @removeClicked="removeTask"
          @toggleDone="toggleDone"
        />
      </ul>
    </Container>
  </main>
</template>

<script>
import Container from "./Container.vue";
import TaskInput from "./TaskInput.vue";
import TaskItem from "./TaskItem.vue";

export default {
  components: {
    TaskInput,
    TaskItem,
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
  padding: 20px;
  width: 100%;
}
.taskList {
  list-style: none;
  padding: 0;
}
</style>
