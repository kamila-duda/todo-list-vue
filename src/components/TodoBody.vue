<template>
  <main class="">
    <input
      class="taskInput"
      type="text"
      placeholder="Type what to do..."
      v-model="newTask"
    />
    <input
      type="button"
      class="taskInput__addButton"
      @click="addTask"
      value="Dodaj"
    />
    <ul class="taskList" v-for="(task, index) in tasks" v-bind:key="index">
      <li class="taskList__item">
        <div
          class="taskList__itemToggleDone"
          @click="toggleDone(task.id)"
          v-if="task.done"
        >
          ✔
        </div>
        <div
          class="taskList__itemToggleDone"
          @click="toggleDone(task.id)"
          v-else
        ></div>
        <span
          class="taskList__itemText"
          v-bind:class="{ taskList__itemDone: task.done }"
          >{{ task.title }}</span>
        <div class="taskList__itemRemove" @click="removeTask(task.id)">❌</div>
      </li>
    </ul>
  </main>
</template>

<script>
export default {
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
    addTask() {
      this.tasks.push({
        id: this.nextTaskId++,
        title: this.newTask,
        done: false,
      });
      this.newTask = null;
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
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.taskInput {
  padding: 10px;
  border-top-left-radius: 15px;
  border-bottom-left-radius: 15px;
  outline: none;
}
.taskInput__addButton {
  border-top-right-radius: 15px;
  border-bottom-right-radius: 15px;
  padding: 10px;
  border: 1px solid #000;
  outline: none;
  cursor: pointer;
  background-color: #005c00;
  color: #fff;
}
.taskList {
  list-style: none;
  padding: 0;
}
.taskList__item {
  display: flex;
  align-items: center;
  border: 1px solid #000;
  border-radius: 15px;
  padding: 10px;
  background-color: #fff;
}
.taskList__itemText {
  flex-grow: 1;
}
.taskList__itemDone {
  text-decoration: line-through;
}
.taskList__itemToggleDone {
  background-color: transparent;
  border: 1px solid #000;
  border-radius: 5px;
  width: 25px;
  height: 25px;
  margin: 5px;
  text-align: center;
  cursor: pointer;
}
.taskList__itemRemove {
  font-size: 25px;
  cursor: pointer;
}
</style>
