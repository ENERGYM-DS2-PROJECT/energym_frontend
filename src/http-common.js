import axios from "axios";

export default axios.create({
 // baseURL: "https://energym-point-prod.herokuapp.com/api",
 baseURL: process.env.REACT_APP_API_URL || 'http://localhost:999',
  headers: {
    "Content-type": "application/json"
  }
});