<template>
  <v-card
    class="mx-auto"
    max-width="400"
    tile>
    <v-card-title>Car details</v-card-title>
    <v-list-item two-line>
    <v-list-item-content>
        <v-list-item-title>Title</v-list-item-title>
        <v-list-item-subtitle>{{ this.defaultItem.title }}</v-list-item-subtitle>
    </v-list-item-content>
    <v-list-item-content>
        <v-list-item-title>Type</v-list-item-title>
        <v-list-item-subtitle>{{ this.defaultItem.car_type }}</v-list-item-subtitle>
    </v-list-item-content>
    <v-list-item-content>
        <v-list-item-title>Color</v-list-item-title>
        <v-list-item-subtitle>{{ this.defaultItem.color }}</v-list-item-subtitle>
    </v-list-item-content>
    </v-list-item>
  </v-card>
</template>

<script>
  import axios from "axios";

  export default {
    data: () => ({
      defaultItem: {
        title: "",
        car_type: "",
        color: "",
      },
    }),
    created() {
      this.getCar()
    },
    methods: {
      getCar() {
        const carId = window.location.pathname.split("/")[2];
        axios.get(window.origin + "/cars/" + carId)
        .then(response => {
            console.log("DONE:",response.data);
            this.dessert = response.data.data;
            this.defaultItem = Object.assign({}, response.data.data);
        })
        .catch(error => {
            console.log(error);
        })
      }
    }
  }
</script>