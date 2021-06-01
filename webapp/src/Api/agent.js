import axios from "axios";

axios.defaults.baseURL = "http://localhost:5000/api";

// Generic function to get information from the api
export async function getDataFromApi(url, setStateFunction) {
    try {
        const response = await axios.get(url);
        setStateFunction(response.data);
    } catch (error) {
        console.log(error);
    }
}
