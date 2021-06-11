import React from "react";

export default function SharpnessBar(props) {
    const {
        redSharpness,
        orangeSharpness,
        yellowSharpness,
        greenSharpness,
        blueSharpness,
        whiteSharpness,
        purpleSharpness,
    } = props;

    return (
        <div className="weapon-sharpness-container">
            <div className="weapon-sharpness-bar">
                <div
                    id="redSharpness"
                    style={{
                        height: "10px",
                        backgroundColor: "#c7362c",
                        width: `${redSharpness}%`,
                    }}
                ></div>
                <div
                    id="orangeSharpness"
                    style={{
                        height: "10px",
                        backgroundColor: "#de7e1f",
                        width: `${orangeSharpness}%`,
                    }}
                ></div>
                <div
                    id="yellowSharpness"
                    style={{
                        height: "10px",
                        backgroundColor: "#e3b249",
                        width: `${yellowSharpness}%`,
                    }}
                ></div>
                <div
                    id="greenSharpness"
                    style={{
                        height: "10px",
                        backgroundColor: "#36a836",
                        width: `${greenSharpness}%`,
                    }}
                ></div>
                <div
                    id="blueSharpness"
                    style={{
                        height: "10px",
                        backgroundColor: "#444fdb",
                        width: `${blueSharpness}%`,
                    }}
                ></div>
                <div
                    id="whiteSharpness"
                    style={{
                        height: "10px",
                        backgroundColor: "white",
                        width: `${whiteSharpness}%`,
                    }}
                ></div>
                <div
                    id="purpleSharpness"
                    style={{
                        height: "10px",
                        backgroundColor: "purpleSharpness",
                        width: `${purpleSharpness}%`,
                    }}
                ></div>
            </div>
        </div>
    );
}
