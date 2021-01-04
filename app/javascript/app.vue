<template>
  <div id="app">
    <v-app>
      <p>{{ message }}</p>
      <cars/>
    </v-app>
  </div>
</template>

<script>
import cars from "./packs/components/cars.vue";

export default {
  data: function () {
    return {
      message: "Cars"
    }
  } ,
  components: {
    cars: cars
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
