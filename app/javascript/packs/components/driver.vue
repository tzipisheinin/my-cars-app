<template>
  <v-card
    class="mx-auto"
    max-width="400"
    tile>
    <v-card-title>Driver details</v-card-title>
    <v-list-item two-line>
    <v-list-item-content>
        <v-list-item-title>Name</v-list-item-title>
        <v-list-item-subtitle>{{ this.defaultItem.name }}</v-list-item-subtitle>
    </v-list-item-content>
    <v-list-item-content>
        <v-list-item-title>Email</v-list-item-title>
        <v-list-item-subtitle>{{ this.defaultItem.email }}</v-list-item-subtitle>
    </v-list-item-content>
    <v-list-item-content>
        <v-list-item-title>Birth Date</v-list-item-title>
        <v-list-item-subtitle>{{ this.defaultItem.birth_date }}</v-list-item-subtitle>
    </v-list-item-content>
    </v-list-item>
  </v-card>
</template>

<script>
  import axios from "axios";

  export default {
    data: () => ({
      defaultItem: {
        name: "",
        email: "",
        birth_date: "",
      },
    }),
    created() {
      this.getItem()
    },
    methods: {
      getItem() {
        const itemId = window.location.pathname.split("/")[2];
        axios.get(window.origin + "/drivers/" + itemId)
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