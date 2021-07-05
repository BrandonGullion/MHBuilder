import React, { useContext } from "react";
import { DevDispatchContext, DevStateContext } from "../Contexts/DevContext";
import { useHistory } from "react-router-dom";
import agent from "../Api/agent";

export default function LoginPage() {
    const history = useHistory();
    const dispatch = useContext(DevDispatchContext);
    const state = useContext(DevStateContext);
    const user = { username: "", password: "" };

    const handleSubmit = () => {
        agent.Users.login(user)
            .then((res) => {
                // Only hit this point if the user has a successful log in
                if (res.status === 200) {
                    console.log("setting user");
                    dispatch({ type: "LOGIN", payload: res.data });
                }
            })
            .then(() => {
                if (state.isAuthenticated) {
                    console.log("Moving user to dev page");
                    history.push("/dev");
                }
            });
    };

    return (
        <div
            style={{
                display: "flex",
                flexDirection: "column",
                justifyContent: "center",
            }}
        >
            <h2
                style={{
                    textAlign: "center",
                    margin: "15px 0 0 0",
                    color: "#ccc",
                }}
            >
                Developer Login
            </h2>
            <input
                placeholder="Username"
                style={{
                    width: "30%",
                    margin: "10px auto 10px auto",
                    padding: "5px",
                    color: "#ccc",
                    background: "none",
                    borderStyle: "solid",
                    borderRadius: "3px",
                }}
                onChange={(e) => (user.username = e.target.value)}
            ></input>
            <input
                placeholder="Password"
                type="password"
                style={{
                    width: "30%",
                    margin: "10px auto 10px auto",
                    padding: "5px",
                    color: "#ccc",
                    background: "none",
                    borderStyle: "solid",
                    borderRadius: "3px",
                }}
                onChange={(e) => (user.password = e.target.value)}
            ></input>
            <button
                style={{
                    width: "30%",
                    margin: "15px auto 15px auto",
                    background: "none",
                    padding: "10px",
                    color: "#ccc",
                    borderRadius: "3px",
                    borderStyle: "solid",
                }}
                onClick={handleSubmit}
            >
                Submit
            </button>
        </div>
    );
}
