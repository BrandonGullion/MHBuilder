import axios from "axios";

axios.defaults.baseURL = process.env.REACT_APP_API_URL;

// This will return the response.data instead of having to type it out each time
const responseBody = (response) => response.data;

const requests = {
    get: async (url) => await axios.get(url).then(responseBody),
    post: async (url, body) => await axios.post(url, body).then(responseBody),
    loginPost: async (url, body) => await axios.post(url, body).then(res => res),
};

const Armors = {
    list: () => requests.get("/armor"),
    create: (armor) => axios.post("/armor", armor),
};

const Weapons = {
    list: () => requests.get("/weapon"),
    create: (weapon) => requests.post("/weapon", weapon),
};

const Skills = {
    list: () => requests.get("/skill"),
    create: (skill) => requests.post("/skill", skill),
};

const RampageSkills = {
    list: () => requests.get("/RampageSkill"),
    create: (rampageSkill) => requests.post("/RampageSkill", rampageSkill),
};

const Updates = {
    list: () => requests.get("/update"),
    create: (update) => requests.post("/update", update)
}

const Fixes = {
    list :() => requests.get("/fixes"),
    create: (fix) => requests.post("/fixes", fix)
}

const Bulletins = {
    list : () => requests.get("/bulletin"),
    create : (bulletin) => requests.post("/bulletin", bulletin)
}

const Users = {
    login : (user) => requests.loginPost("/account/login", user),
    create: (user) => requests.post("/account/register", user)
}

const agent = {
    Armors,
    Weapons,
    Skills,
    RampageSkills,
    Fixes,
    Users,
    Bulletins,
    Updates
};

export default agent;
