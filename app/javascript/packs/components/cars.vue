<template>
  <v-data-table
    :headers="headers"
    :items="desserts"
    :items-per-page="5"
    class="elevation-1"
  ></v-data-table>
</template>

<script>
  export default {
    data () {
      return {
        headers: [
          {
            text: 'Title',
            align: 'start',
            sortable: false,
            value: 'title',
          },
          { text: 'Type', value: 'type' },
          { text: 'Color', value: 'color' },
        ],
        desserts: [
          {
            title: 'Toyota',
            type: "Hybrid",
            color: "red",
          }
        ],
      }
    },
  }
</script>