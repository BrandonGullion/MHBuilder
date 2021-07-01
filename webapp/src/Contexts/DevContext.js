import React, { createContext, useReducer } from "react";

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
            default:
                break;
        }
    };

    const [state, dispatch] = useReducer(reducer, initialState);

    return (
        <DevStateContext.Provider value={state}>
            <DevDispatchContext.Provider value={dispatch}>
                {props.children}
            </DevDispatchContext.Provider>
        </DevStateContext.Provider>
    );
}
