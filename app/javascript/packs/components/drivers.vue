<template>
  <v-data-table 
    :headers="headers" 
    :items="desserts" 
    sort-by="title" 
    class="elevation-1">
    <template v-slot:top>
      <v-toolbar flat color="white">
        <v-toolbar-title>My Drivers</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
        <v-dialog v-model="dialog" max-width="500px">
          <template v-slot:activator="{ on }">
            <v-btn color="primary" dark class="mb-2" v-on="on">New Item</v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="headline">New Item</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="newItem.name" label="Name"></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="newItem.email" label="Email"></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="newItem.birth_date" label="Birth Date"></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="close">Cancel</v-btn>
              <v-btn color="blue darken-1" text @click="save(newItem)">Save</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <template v-slot:item.action="{ item }">
      <v-icon small class="mr-2" @click="viewItem(item)">expand</v-icon>
    </template>
    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize">Reset</v-btn>
    </template>
  </v-data-table>
</template>

<script>

import axios from "axios";

  export default {
      data: () => ({
          dialog: false,
          headers: [
            {
              text: 'Name',
              align: 'start',
              sortable: false,
              value: 'name',
            },
            { text: 'Email', value: 'email' },
            { text: 'Birth Date', value: 'birth_date' },
            { text: "View", value: "action", sortable: false }
          ],
          desserts: [],
          defaultItem: {
            name: "",
            email: "",
            birth_date: "",
          },
          newItem: {
            name: "",
            email: "",
            birth_date: "",
          },
      }),
      watch: {
        dialog(val) {
            val || this.close();
        }
      },
      created() {
          this.initialize();
      },
      methods: { 
        initialize() {
          return axios
          .get(window.origin + '/drivers')
          .then(response => {
              console.log(response.data);
              this.desserts = response.data;
          })
          .catch(e => {
              console.log(e);
          });
        },

        viewItem(item) {
          window.location.pathname = "/view-driver/" + item.id;
        },

        save(item) {
          console.log("SAVE!!", item)
          axios.post(`http://localhost:3000/drivers/`, {
              driver: this.newItem
          })
          .then(response => {
              this.initialize();
          })
          .catch(error => {
              console.log(error);
          });
          this.close();
        },

        close() {
          this.dialog = false;
          setTimeout(() => {
              this.newItem = Object.assign({}, this.defaultItem);
          }, 300);
        }
    }
  };
</script>