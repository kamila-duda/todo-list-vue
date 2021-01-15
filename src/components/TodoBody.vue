<template>
  <main>
    <TaskInput
      class="taskInput__container"
      @addedTask="addTask"
      v-bind:newTask="newTask"
    />
    <Container>
      <p class="taskList__empty" v-if="tasks.length < 1">
        Nie masz jeszcze żadnych zadań. Dodaj zadanie, by o niczym nie zapomnieć
        😉
      </p>
      <TasksItems
        v-else
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
      tasks: JSON.parse(localStorage.getItem("tasks")) || [],
    };
  },
  methods: {
    addTask(newTask) {
      this.tasks.push({
        id: newTask,
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
      localStorage.setItem("tasks", JSON.stringify(this.tasks));
    },
    focusInput() {
      this.$refs.taskInput.focus();
    },
  },
  watch: {
    tasks: function () {
      localStorage.setItem("tasks", JSON.stringify(this.tasks));
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
.taskList__empty {
  display: flex;
  align-items: center;
  border: 1px solid #000;
  border-radius: 15px;
  padding: 30px;
  margin: 40px 20px;
  background-color: #fff;
}
</style>
