<template>
  <v-app>
  <div class="wrraper">
    <v-container fluid>
      <v-row align="center">
        <v-col
          class="d-flex"
          cols="12"
          sm="6">
          <v-select
            :items="drivers"
            item-text="name"
            item-value="id"
            v-model="selectedDriver"
            filled
            label="Driver">
          </v-select>
        </v-col>
      </v-row>
      <v-btn
        medium
        color="success"
        dark @click="showCarsForDriver()">
        Show cars for selected driver
      </v-btn>
    </v-container>

    <v-container fluid>
      <v-row align="center">
        <v-col
          class="d-flex"
          cols="12"
          sm="6">
          <v-select
            :items="cars"
            item-text="name"
            item-value="id"
            filled
            v-model="selectedCar"
            label="Car">
          </v-select>
        </v-col>
      </v-row>
      <v-btn
        medium
        color="success"
        dark @click="showDriversForCar()">
        Show drivers for selectd car
      </v-btn>
    </v-container>
  </div>
    <dataTable :title="resultTitle" :headers="resultHeaders" :desserts="resultItems"/>
  </v-app>
</template>

<script>
  import axios from "axios";
  import dataTable from "../components/dataTable.vue";

  export default {
    data: () => ({
      drivers: [],
      cars: [],
      resultTitle: "Results are comming soon ...",
      resultHeaders: [
        { 
          text: 'id', 
          value: 'id',
          align: 'start',
          sortable: false
        },
        { text: 'name', value: 'name' },
        { text: 'Attached at', value: 'attached_at'}
      ],
      resultItems: [],
      selectedCar: null,
      selectedDriver: null,
    }),
    components: {
      dataTable: dataTable
    },
    created() {
      this.initialize();
    },
    methods: { 
      initialize() {
        axios
        .get(window.origin + '/drivers')
        .then(response => {
            console.log(response.data);
            this.drivers = response.data.map(({id, name}) => {
              return {
                id, name
              }
            });
        })
        .catch(e => {
            console.log(e);
        });
        axios
        .get(window.origin + '/cars')
        .then(response => {
            console.log(response.data);
            this.cars = response.data.map(({id, title, car_type, color}) => {
              return {
                id, name: title + '_' + car_type + '_' + color
              }
            });
        })
        .catch(e => {
            console.log(e);
        });
      },

      showCarsForDriver() {
        console.log("selectedCar", this.selectedDriver);
        axios
        .get(window.origin + '/get-cars-for-driver/' + this.selectedDriver)
        .then(response => {
          this.resultTitle = "Cars For Driver";
          this.resultItems = response.data;
        })
        .catch(e => {
          console.log(e);
        });
      },

      showDriversForCar() {
        console.log("selectedCar", this.selectedCar);
        axios
        .get(window.origin + '/get-drivers-for-car/' + this.selectedCar)
        .then(response => {
          this.resultTitle = "Drivers For Car";
          this.resultItems = response.data;
        })
        .catch(e => {
          console.log(e);
        });
      }
    }
  }
</script>

<style scoped>
  .wrraper {
    display: inherit;
  }
</style>