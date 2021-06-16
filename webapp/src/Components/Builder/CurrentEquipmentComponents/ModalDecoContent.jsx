import React, { useState } from "react";
import { IoMdClose } from "react-icons/io";

// Try to use the context to get access to the dispatch
export default function ModalDecoContent(props) {
    const { modalState, dispatch, skills, closeModal } = props;

    const [selectedSkill, setSelectedSkill] = useState({});

    const handleDecoSelect = (skill) => {
        setSelectedSkill(skill)
    };
    
    const handleDecoSubmit = () => {
        dispatch({ type: "SET_DECORATION" , payload:{equipment:modalState.armor, slotNumber:modalState.currentDecoSlot, skill:selectedSkill}});
    }

    return (
        <div>
            <div style={{ color: "#cccccc", fontSize: "20px" }}>
                Select a decoration
            </div>
            <div style={{ width: "100%" }}>
                <label style={{ width: "20%", color: "#cccccc" }}>
                    Skill Name
                </label>
                <label style={{ width: "25%", color: "#cccccc" }}>
                    Decoration Name
                </label>
                <label style={{ width: "55%", color: "#cccccc" }}>
                    Description
                </label>
            </div>
            <div
                onClick={() => closeModal()}
                className="white-border-hover"
                style={{
                    margin: "5px 5px 0px 0px",
                    height: "30px",
                    width: "30px",
                    position: "absolute",
                    top: "0",
                    right: "0",
                    color: "#ccc",
                    fontSize: "24px",
                    cursor: "pointer",
                }}
            >
                <IoMdClose
                    style={{ position: "relative", bottom: "5px", left: "3px" }}
                ></IoMdClose>
            </div>
            <div style={{ overflowY: "scroll", height: "400px" }}>
                {skills.map((skill) => (
                    <div
                        key={skill.id}
                        onClick={() => handleDecoSelect(skill)}
                        className={
                            skill.id === selectedSkill.id
                                ? "glass-card white-border-hover active-item-border"
                                : "glass-card white-border-hover"
                        }
                        style={{
                            zIndex: "5",
                            padding: "5px",
                            fontSize: "14px",
                            margin: "5px 0px",
                            cursor: "pointer",
                        }}
                    >
                        <div style={{ width: "100%" }} key={skill.id}>
                            <label style={{ width: "20%", cursor: "pointer" }}>
                                {skill.jewelName}
                            </label>
                            <label style={{ width: "25%", cursor: "pointer" }}>
                                {skill.name}
                            </label>
                            <label style={{ width: "55%", cursor: "pointer" }}>
                                {skill.description}
                            </label>
                        </div>
                    </div>
                ))}
            </div>
            <div
                onClick={handleDecoSubmit}
                className="default-button"
                style={{
                    float: "right",
                    margin: "5px 10px",
                }}
            >
                Confirm
            </div>
        </div>
    );
}
