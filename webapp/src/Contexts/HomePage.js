import axios from "axios";
import React, { useEffect, useReducer, createContext } from "react";

export const HomePageDispatchContext = createContext();
export const HomePageStateContext = createContext();

export const HomePageContext = (props) => {
    const initialState = {
        updates: [],
        fixes: [],
    };

    const [state, dispatch] = useReducer(reducer, initialState);

    function reducer(state, action) {
        switch (action.type) {
            case "SET_UPDATES":
                return { ...state, updates: action.payload };
            case "SET_FIXES":
                return { ...state, fixes: action.payload };
            default:
                break;
        }
    }


    useEffect(() => {
        try {
            // Gets the latest updates
            axios
                .get("http://localhost:5000/api/update")
                .then((res) =>
                    dispatch({ type: "SET_UPDATES", payload: res.data })
                );
            // Gets the lates fixes 
            axios
                .get("http://localhost:5000/api/fixes")
                .then((res) =>
                    dispatch({ type: "SET_FIXES", payload: res.data })
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
