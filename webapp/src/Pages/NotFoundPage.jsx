import React from "react";
import { useHistory } from "react-router-dom";

export default function NotFoundPage() {
    const history = useHistory();

    return (
        <div
            style={{
                display: "flex",
                justifyContent: "center",
                flexDirection: "column",
            }}
        >
            <label
                style={{ fontSize: "30px", color: "#ccc", margin: "50px auto" }}
            >
                We are sorry, it looks like there's nothing here!
            </label>
            <button
                style={{ width: "350px", margin: "10px auto" }}
                className="index-button"
                onClick={() => history.push("/")}
            >
                Click here to return home!
            </button>
        </div>
    );
}
