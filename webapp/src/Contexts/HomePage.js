import axios from "axios";
import React, { useEffect, useReducer, createContext } from "react";
import agent from "../Api/agent";

export const HomePageDispatchContext = createContext();
export const HomePageStateContext = createContext();

export const HomePageContext = (props) => {
    const initialState = {
        updates: [],
        fixes: [],
        bulletins: [],
    };

    const [state, dispatch] = useReducer(reducer, initialState);

    function reducer(state, action) {
        switch (action.type) {
            case "SET_UPDATES":
                return { ...state, updates: action.payload };
            case "SET_FIXES":
                return { ...state, fixes: action.payload };
            case "SET_BULLETINS":
                return { ...state, bulletins: action.payload };
            default:
                break;
        }
    }

    useEffect(() => {
        try {
            // Gets the latest updates
            agent.Updates.list().then((response) =>
                dispatch({ type: "SET_UPDATES", payload: response })
            );
            // Gets the lates fixes
            agent.Fixes.list().then((response) =>
                dispatch({ type: "SET_FIXES", payload: response })
            );
            agent.Bulletins.list().then((response) =>
                dispatch({ type: "SET_BULLETINS", payload: response })
            );
        } catch (error) {
            console.log(error);
        }
    }, []);

    return (
        <HomePageDispatchContext.Provider value={dispatch}>
            <HomePageStateContext.Provider value={state}>
                {props.children}
            </HomePageStateContext.Provider>
        </HomePageDispatchContext.Provider>
    );
};
