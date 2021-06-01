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
        <div className="weapon-sharpness-bar">
            <div
                id="redSharpness"
                style={{
                    height: "10px",
                    backgroundColor: "red",
                    width: `${redSharpness}%`,
                }}
            ></div>
            <div
                id="orangeSharpness"
                style={{
                    height: "10px",
                    backgroundColor: "orange",
                    width: `${orangeSharpness}%`,
                }}
            ></div>
            <div
                id="yellowSharpness"
                style={{
                    height: "10px",
                    backgroundColor: "yellow",
                    width: `${yellowSharpness}%`,
                }}
            ></div>
            <div
                id="greenSharpness"
                style={{
                    height: "10px",
                    backgroundColor: "green",
                    width: `${greenSharpness}%`,
                }}
            ></div>
            <div
                id="blueSharpness"
                style={{height:"10px", backgroundColor:"blue", width: `${blueSharpness}%` }}
            ></div>
            <div
                id="whiteSharpness"
                style={{height:"10px", backgroundColor:"white", width: `${whiteSharpness}%` }}
            ></div>
            <div
                id="purpleSharpness"
                style={{ height:"10px", backgroundColor:"purpleSharpness", width: `${purpleSharpness}%` }}
            ></div>
        </div>
    );
}
