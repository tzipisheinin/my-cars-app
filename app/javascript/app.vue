<template>
  <div id="app">
    <v-app>
      <v-sheet
        height="400"
        class="overflow-hidden"
        style="position: relative;">
      <sideBar :onSelected="changeRoute"/>
      <div class="content">
        <cars v-if="this.carsListView" />
        <drivers v-else-if="this.driversListView" />
        <car v-else-if="this.carDetailsView" />
        <driver v-else-if="this.driverDetailsView" />
        <drivers-and-cars v-else-if="this.driverAndCarsView" />
      </div>
    </v-sheet>
  </v-app>
  </div>
</template>

<script>
import sideBar from "./packs/components/menu.vue";
import cars from "./packs/components/cars.vue";
import car from "./packs/components/car.vue";
import drivers from "./packs/components/drivers.vue";
import driver from "./packs/components/driver.vue";
import driverAndCars from "./packs/components/driversAndCars.vue";


export default {
  data: function () {
    return {
      currentRoute: window.location.pathname,
    }
  },
  computed: {
    carsListView () {
      return this.currentRoute.match(new RegExp('/cars-list'));
    },
    carDetailsView () {
      return Boolean(this.currentRoute.match(new RegExp('/view-car')));
    },
    driversListView () {
      return this.currentRoute.match(new RegExp('/drivers-list'));
    },
    driverDetailsView () {
      return Boolean(this.currentRoute.match(new RegExp('/view-driver')));
    },
    driverAndCarsView () {
      return Boolean(this.currentRoute.match(new RegExp('/drivers-and-cars')));
    }
  },
  components: {
    sideBar: sideBar,
    cars: cars,
    car: car,
    drivers: drivers,
    driver: driver,
    'drivers-and-cars': driverAndCars
  },
  methods: {
    changeRoute(route) {
      window.location.pathname = route;
      // this.currentRoute = route;
    }
  }
}
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
  .content {
    width: calc(100% - 256px)
  }
</style>
