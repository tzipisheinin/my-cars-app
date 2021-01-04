<template>
  <v-data-table 
    :headers="headers" 
    :items="desserts" 
    sort-by="" 
    class="elevation-1">
    <template v-slot:top>
      <v-toolbar flat color="white">
        <v-toolbar-title>{{title}}</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
      </v-toolbar>
    </template>
  </v-data-table>
</template>

<script>

export default {
  props: { title: String,
           headers: Array,
           desserts: Array 
  },
};

</script>