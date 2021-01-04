import axios from "axios";

function httpGet(path, params) {

    return axios
    .get(window.origin + path + '/' + params)
    .then(response => {
        console.log(response.data);
        return response.data;
    })
}