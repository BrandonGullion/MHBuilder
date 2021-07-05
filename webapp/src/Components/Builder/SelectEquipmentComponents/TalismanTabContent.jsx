import React, { useState, useContext, useEffect } from "react";
import {
    BuilderDispatchContext,
    BuilderStateContext,
} from "../../../Contexts/BuilderContext";
import Dropdown from "react-dropdown";
import "react-dropdown/style.css";
import Counter from "../../ReUsable/Counter";
import DecorationItem from "../CurrentEquipmentComponents/DecorationItem";

export default function TalismanTabContent() {
    const state = useContext(BuilderStateContext);
    const dispatch = useContext(BuilderDispatchContext);

    // This could realistically be dropped down to a key value pair dict.
    const [firstSkillLvl, setFirstSkillLvl] = useState(1);
    const [secondSkillLvl, setSecondSkillLvl] = useState(1);
    const [thirdSkillLvl, setThirdSkillLvl] = useState(1);

    const [firstSkill, setFirstSkill] = useState({});
    const [secondSkill, setSecondSkill] = useState({});
    const [thirdSkill, setThirdSkill] = useState({});

    const [skillOptions, setSkillOptions] = useState([]);

    // Generate the skill list and set it to the states talisman skills; This is calced after
    // each change in the decorations for the talisman
    const createSkillList = () => {
        const skillArray = [];
        if (firstSkill.name !== undefined) {
            for (let i = 0; i < firstSkillLvl; i++) {
                skillArray.push(firstSkill);
            }
        }
        if (secondSkill.name !== undefined) {
            for (let i = 0; i < secondSkillLvl; i++) {
                skillArray.push(secondSkill);
            }
        }
        if (thirdSkill.name !== undefined) {
            for (let i = 0; i < thirdSkillLvl; i++) {
                skillArray.push(thirdSkill);
            }
        }

        dispatch({ type: "SET_TALISMAN_SKILLS", payload: skillArray });
        dispatch({ type: "SET_CURRENT_SKILLS" });
    };

    useEffect(() => {
        createSkillList();
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [
        firstSkill,
        secondSkill,
        thirdSkill,
        firstSkillLvl,
        secondSkillLvl,
        thirdSkillLvl,
    ]);

    // Once state.skills has been loaded from the api, order them and then create
    // skill list options
    useEffect(() => {
        if (skillOptions.length === 0) {
            const tempSkillArray = state.skills;
            const skillOptionsArray = [];
            tempSkillArray.sort((a, b) => (a.name > b.name ? 1 : -1));
            tempSkillArray.forEach((skill) => {
                skillOptionsArray.push({
                    id: skill.id,
                    value: skill,
                    label: skill.name,
                });
            });
            setSkillOptions(skillOptionsArray);
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [state.skills, skillOptions.length]);

    return (
        <div style={{ color: "#ccc", height: "659px" }}>
            <div
                style={{
                    backgroundColor: "rgba(255, 100, 89, 0.6)",
                    borderRadius: "5px",
                    padding: "5px",
                    color: "white",
                    margin: "10px",
                    fontSize:"14px",
                    width:"90%"
                }}
            >
                <label  style={{padding:"5px 20px"}}>
                    Please note that you can create unrealistic talisman's at
                    this time.
                </label>
            </div>

            <h3 style={{ margin: "10px 0px 0px 0px" }}>Skill 1</h3>
            <div style={{ display: "flex" }}>
                <div style={{ width: "250px" }}>
                    <Dropdown
                        onChange={(e) => {
                            setFirstSkill(e.value);
                        }}
                        options={skillOptions}
                        placeholder="Select Skill"
                    ></Dropdown>
                </div>
                <label style={{ fontSize: "24px", margin: "0px 0px 0px 20px" }}>
                    Lvl
                </label>
                <Counter
                    number={firstSkillLvl}
                    setNumber={setFirstSkillLvl}
                ></Counter>
            </div>
            <h3 style={{ margin: "10px 0px 0px 0px" }}>Skill 2</h3>
            <div style={{ display: "flex" }}>
                <div style={{ width: "250px" }}>
                    <Dropdown
                        onChange={(e) => {
                            setSecondSkill(e.value);
                        }}
                        options={skillOptions}
                        placeholder="Select Skill"
                    ></Dropdown>
                </div>
                <label style={{ fontSize: "24px", margin: "0px 0px 0px 20px" }}>
                    Lvl
                </label>
                <Counter
                    number={secondSkillLvl}
                    setNumber={setSecondSkillLvl}
                ></Counter>
            </div>
            <h3 style={{ margin: "10px 0px 0px 0px" }}>Skill 3</h3>
            <div style={{ display: "flex" }}>
                <div style={{ width: "250px" }}>
                    <Dropdown
                        onChange={(e) => {
                            setThirdSkill(e.value);
                        }}
                        options={skillOptions}
                        placeholder="Select Skill"
                    ></Dropdown>
                </div>
                <label style={{ fontSize: "24px", margin: "0px 0px 0px 20px" }}>
                    Lvl
                </label>
                <Counter
                    number={thirdSkillLvl}
                    setNumber={setThirdSkillLvl}
                ></Counter>
            </div>
            <div style={{ margin: "30px 0 0 0" }}>
                <DecorationItem
                    flexDirection="column"
                    equipment={{
                        type: "talisman",
                        decoSlot1Lvl: 3,
                        decoSlot2Lvl: 3,
                        decoSlot3Lvl: 3,
                    }}
                ></DecorationItem>
            </div>
        </div>
    );
}
