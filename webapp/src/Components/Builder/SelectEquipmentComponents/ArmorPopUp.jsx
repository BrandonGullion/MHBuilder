import React, { useEffect, useState } from "react";
import { GenerateDecoIcon } from "../../../Helpers/DecoFunctions";
import DefenseDisplay from "../CurrentEquipmentComponents/DefenseDisplay";
import SkillItem from "../StatsComponents/SkillItem";
import { filterSkills } from "../StatsComponents/Stats";

export default function ArmorPopUp(props) {
    const { armorPiece } = props;

    const lineThickness = "1px";
    const lineColor = "white";

    const [filteredSkills, setFilteredSkills] = useState([]);

    // Run the filter of skills once, because they should not change during the
    // dom lifecycle
    useEffect(() => {
        if (armorPiece.name !== undefined) {
            filterSkills(armorPiece.skills, setFilteredSkills);
        }
    }, [armorPiece.name, armorPiece.skills]);

    return (
        <div className="armor-popup">
            <div style={{ display: "flex", position: "relative", marginTop:"10px" }}>
                <label>{armorPiece.name}</label>
                <div style={{ position: "relative", marginLeft:"50px" }}>
                    {GenerateDecoIcon(
                        armorPiece.decoSlot1Lvl,
                        lineColor,
                        lineThickness,
                        true
                    )}
                </div>
                <div style={{ position: "relative" }}>
                    {GenerateDecoIcon(
                        armorPiece.decoSlot2Lvl,
                        lineColor,
                        lineThickness,
                        true,
                    )}
                </div>
                <div style={{position:"relative"}}>
                    {GenerateDecoIcon(
                        armorPiece.decoSlot3Lvl,
                        lineColor,
                        lineThickness,
                        true
                    )}
                </div>
            </div>
            <DefenseDisplay armorPiece={armorPiece}></DefenseDisplay>
            {filteredSkills.map((skillObject) => (
                <SkillItem
                    key={skillObject.skill.id}
                    skillObject={skillObject}
                ></SkillItem>
            ))}
        </div>
    );
}
