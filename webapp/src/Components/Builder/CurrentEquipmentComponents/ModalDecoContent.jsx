import React, { useContext, useEffect, useState } from "react";
import { IoMdClose } from "react-icons/io";
import {
    BuilderDispatchContext,
    BuilderStateContext,
} from "../../../Contexts/BuilderContext";
import { filterList } from "../../../SearchFunctions";

// Try to use the context to get access to the dispatch
export default function ModalDecoContent(props) {
    const { modalState, closeModal } = props;

    const state = useContext(BuilderStateContext);
    const dispatch = useContext(BuilderDispatchContext);

    const [selectedSkill, setSelectedSkill] = useState({});
    const [filteredSkills, setFilteredSkills] = useState([]);
    const [decoLvlFilteredSkills, setDecoLvlFilteredSkills] = useState([]);

    const filterSkills = (skills, decoSlotLvl) => {
        let array = [];
        skills.forEach((skill) => {
            // If statement removes any skills that are not available as decorations
            if (skill.jewelName !== undefined && skill.jewelName !== "" && skill.jewelName !== null) {
                let jewelLvl = skill.jewelName.split("");
                if (jewelLvl[jewelLvl.length - 1] <= decoSlotLvl.toString()) {
                    array.push(skill);
                }
            }
        });
        return array;
    };

    useEffect(() => {
        setDecoLvlFilteredSkills(
            filterSkills(state.skills, modalState.currentDecoLvl)
        );
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);

    // once the decolvlfiltered skills are updated, then create a copy that can be used for the search function
    useEffect(() => {
        setFilteredSkills(decoLvlFilteredSkills);
    }, [decoLvlFilteredSkills]);

    const handleDecoSelect = (skill) => {
        setSelectedSkill(skill);
    };

    const handleDecoSubmit = () => {
        if (selectedSkill.name !== undefined) {
            dispatch({
                type: "SET_DECORATION",
                payload: {
                    equipment: modalState.armor,
                    slotNumber: modalState.currentDecoSlot,
                    skill: selectedSkill,
                },
            });
            dispatch({ type: "SET_CURRENT_SKILLS" });
            closeModal();
        }
    };

    const handleSearchChange = (searchCriteria) => {
        setFilteredSkills(filterList(searchCriteria, decoLvlFilteredSkills));
    };

    return (
        <div>
            <div style={{ position: "relative" }}>
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
                    <input
                        placeholder="Search"
                        style={{
                            position: "absolute",
                            top: "29px",
                            right: "20px",
                        }}
                        onChange={(e) => handleSearchChange(e.target.value)}
                    ></input>
                </div>
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
                {filteredSkills.map((skill, skillId) => (
                    <div
                        key={skillId}
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
                            backdropFilter: "none",
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
