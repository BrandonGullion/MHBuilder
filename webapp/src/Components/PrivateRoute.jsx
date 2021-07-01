import React, { useContext } from "react";
import { Route, Redirect } from "react-router-dom";
import { DevStateContext } from "../Contexts/DevContext";

export default function PrivateRoute({ children, ...rest }) {
    
    const state = useContext(DevStateContext);
    console.log(state);
    console.log(state.isAuthenticated);
    console.log(state.isAuthenticated === true);

    return (
        <Route
            {...rest}
            render={() => {
                return state.isAuthenticated === true ? (
                    children
                ) : (
                    <Redirect to="/login"></Redirect>
                );
            }}
        ></Route>
    );
}
