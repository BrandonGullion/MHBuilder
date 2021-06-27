import React from "react";
import { FaAngleDown, FaAngleUp } from "react-icons/fa";

// In the future to re-use counter, a min max value should be set to allow for true re-usability
export default function Counter(props) {
    const { number, setNumber } = props;

    // Increase or decrease the skill lvl
    const handleNumberChange = (IncOrDecString) => {
        if (IncOrDecString === "Increment") {
            number + 1 > 7
                ? console.log("Cannot increase skill amount any more")
                : setNumber((prevValue) => prevValue + 1);
        } else if (IncOrDecString === "Decrement") {
            number - 1 === 0
                ? console.log("Cannot reduce skill amount any more")
                : setNumber((prevValue) => prevValue - 1);
        } else {
            console.log("Increment/Decrement Error has occurred");
        }
    };

    return (
        <div style={{ display: "flex" }}>
            <h3 style={{ margin: "0 5px 0 5px", fontSize: "24px" }}>
                {number}
            </h3>
            <div
                onClick={() => handleNumberChange("Increment")}
                className="default-button"
                style={{
                    fontSize: "30px",
                    padding: "0px 0 0 0",
                    height: "30px",
                    display: "flex",
                    margin: "0 5px 0 5px",
                }}
            >
                <FaAngleUp></FaAngleUp>
            </div>
            <div
                onClick={() => handleNumberChange("Decrement")}
                className="default-button"
                style={{
                    fontSize: "30px",
                    padding: "0px 0 0 0",
                    height: "30px",
                    display: "flex",
                    margin: "0 5px 0 5px",
                }}
            >
                <FaAngleDown></FaAngleDown>
            </div>
        </div>
    );
}
