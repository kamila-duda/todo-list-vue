<template >
  <ul>
    <li
      class="taskList__item"
      v-for="(task, index) in tasks"
      v-bind:key="index"
    >
      <div
        class="taskList__itemToggleDone"
        @click="toggleDone(task.id)"
        v-if="task.done"
      >
        ✔
      </div>
      <div class="taskList__itemToggleDone" @click="toggleDone(task.id)" v-else></div>
      <span
        class="taskList__itemText"
        v-bind:class="{ taskList__itemDone: task.done }"
        >{{ task.title }}</span
      >
      <div class="taskList__itemRemove" @click="removeTask(task.id)">❌</div>
    </li>
  </ul>
</template>

<script>
export default {
  name: "TasksItems",
  props: ["tasks"],
  methods: {
    removeTask(id) {
      this.$emit("removeClicked", id);
    },
    toggleDone(id) {
      this.$emit("toggleDone", id);
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.taskList__item {
  display: flex;
  align-items: center;
  border: 1px solid #000;
  border-radius: 15px;
  padding: 10px;
  margin: 20px;
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
  color: red;
}
</style>
