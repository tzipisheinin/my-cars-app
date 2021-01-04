<template>
  <v-navigation-drawer
    absolute
    right
    permanent>
      <v-list-item>
      <v-list-item-content>
          <v-list-item-title class="title">
          Menu
          </v-list-item-title>
          <v-list-item-subtitle>
          pick one
          </v-list-item-subtitle>
      </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>

      <v-list
      dense
      nav>
      <v-list-item
          v-for="item in items"
          :key="item.title"
          @click="goTo(item.path)"
          link>
          <v-list-item-icon>
          <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
          <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
      </v-list-item>
      </v-list>
  </v-navigation-drawer>
</template>

<script>
  export default {
    data: function () {
      return {
        items: [
          { title: 'Cars', icon: 'mdi-view-dashboard' , path: '/cars-list'},
          { title: 'Drivers', icon: 'mdi-image' , path: '/drivers-list'},
          { title: 'Drivers of Cars', icon: 'mdi-help-box', path: '/drivers-and-cars' },
        ],
      }
    },
    props: { onSelected: {type: Function} },
    methods: {
      goTo(path) {
        this.onSelected(path);
      }
    },
  }
</script>