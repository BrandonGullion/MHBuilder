import React, { createContext, useEffect, useReducer } from "react";
import agent from "../Api/agent";

export const DevStateContext = createContext();
export const DevDispatchContext = createContext();

export default function DevContext(props) {
    const initialState = {
        user: {
            username: "",
            displayName: "",
            token: "",
        },
        isAuthenticated: false,
        rampageSkills: [],
        skills: [],
    };

    const reducer = (state, action) => {
        switch (action.type) {
            // Sets the user when they are successfully logged in
            case "LOGIN":
                state.user = action.payload;
                state.isAuthenticated = true;
                if (state.user.token) {
                    window.localStorage.setItem("jwt", state.user.token);
                }
                return { ...state };
            case "LOG_OUT":
                break;
            case "SET_SKILLS":
                return { ...state, skills: action.payload };
            case "SET_RAMPAGE_SKILLS":
                return { ...state, rampageSkills: action.payload };
            default:
                break;
        }
    };
    
    const [state, dispatch] = useReducer(reducer, initialState);

    useEffect(() => {
        agent.Skills.list().then((response) =>
            dispatch({ type: "SET_SKILLS", payload: response })
        );
        agent.RampageSkills.list().then((response) =>
            dispatch({ type: "SET_RAMPAGE_SKILLS", payload: response })
        );
    }, []);

    return (
        <DevStateContext.Provider value={state}>
            <DevDispatchContext.Provider value={dispatch}>
                {props.children}
            </DevDispatchContext.Provider>
        </DevStateContext.Provider>
    );
}
