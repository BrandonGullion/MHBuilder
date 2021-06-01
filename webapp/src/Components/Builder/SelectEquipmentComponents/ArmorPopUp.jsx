import React, { useEffect, useState } from "react";
import DefenseDisplay from "../CurrentEquipmentComponents/DefenseDisplay";
import SkillItem from "../StatsComponents/SkillItem";
import { filterSkills } from "../StatsComponents/Stats";

export default function ArmorPopUp(props){
    const {armorPiece} = props;

    const [filteredSkills, setFilteredSkills] = useState([]);

    // Run the filter of skills once, because they should not change during the 
    // dom lifecycle 
    useEffect(() => {
        if(armorPiece.name !== undefined){
            filterSkills(armorPiece.skills, setFilteredSkills);
        }
    }, [armorPiece.name, armorPiece.skills]);

    return <div className="armor-popup">
            <label>{armorPiece.name}</label>
            <DefenseDisplay armorPiece={armorPiece}></DefenseDisplay>
            {filteredSkills.map((skillObject) => 
                <SkillItem key={skillObject.skill.id} skillObject ={skillObject}></SkillItem>
            )}
        </div>
    

}