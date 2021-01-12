<template>
  <section>
    <Container class="taskInput__flex">
      <input
        class="taskInput"
        type="text"
        placeholder="Type what to do..."
        v-model="newTask"
        ref="taskInput"
        autofocus
      />
      <input
        type="button"
        class="taskInput__addButton"
        @click="addTask(), focusInput()"
        value="Dodaj"
      />
    </Container>
  </section>
</template>

<script>
import Container from "./Container.vue";

export default {
  name: "TaskInput",
  components: {
    Container,
  },
  data() {
    return {
      newTask: "",
    };
  },
  methods: {
    addTask() {
      this.$emit("addedTask", this.newTask);
      this.newTask = "";
    },
    focusInput() {
      this.$refs.taskInput.focus();
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.taskInput__flex {
  display: flex;
  padding: 20px;
}
.taskInput {
  padding: 10px;
  border-top-left-radius: 15px;
  border-bottom-left-radius: 15px;
  outline: none;
  flex-grow: 1;
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
  font-size: 20px;
  font-family: inherit;
}
</style>
