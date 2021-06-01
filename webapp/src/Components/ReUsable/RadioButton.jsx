import React from "react";
import { FiCircle } from "react-icons/fi";
import { FaCircle } from "react-icons/fa";

export default function RadioButton(props) {
    const { active, content, onClick } = props;

    return (
        <div className="radio-button" onClick={onClick}>
            {active === true ? (
                <div
                    style={{
                        position: "relative",
                        display: "inline-block",
                    }}
                >
                    <FiCircle
                        style={{
                            position: "absolute",
                            left: "0px",
                            top: "2px",
                        }}
                    ></FiCircle>
                    <FaCircle
                        style={{
                            position: "absolute",
                            left: "3px",
                            top: "5px",
                            fontSize: "6px",
                        }}
                    ></FaCircle>
                    <label style={{ marginLeft: "18px" }}>{content}</label>
                </div>
            ) : (
                <div>
                    <FiCircle
                        style={{
                            marginRight: "5px",
                            marginBottom: "2px",
                        }}
                    ></FiCircle>
                    <label>{content}</label>
                </div>
            )}
        </div>
    );
}
