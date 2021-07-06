import React from "react";
import { FiHexagon } from "react-icons/fi";
import { Popup } from "semantic-ui-react";
import SkillLevelItem from "./SkillLevelItem";
import SkillPopUp from "./SkillPopUp";

export default function SkillItem(props) {
    const { skillObject } = props;
    const { skill, count } = skillObject;

    return (
        <Popup
            position="left center"
            content={<SkillPopUp skillObject={skillObject}></SkillPopUp>}
            trigger={
                <div style={{ display: "flex", position: "relative", cursor:"pointer", margin:"10px 0px" }}>
                    <FiHexagon
                        style={{
                            fontSize: "10px",
                            position: "relative",
                            top: "6px",
                            margin: "0px 5px",
                        }}
                    ></FiHexagon>
                    <h4 style={{ fontSize: "14px" }}>{skill.name}</h4>
                    {/* Add current Skill level and max skill level */}
                    <SkillLevelItem
                        maxLevel={skill.maxLevel}
                        currentLevel={count}
                    ></SkillLevelItem>
                </div>
            }
        ></Popup>
    );
}
