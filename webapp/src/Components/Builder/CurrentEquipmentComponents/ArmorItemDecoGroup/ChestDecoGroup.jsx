import React from "react";
import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function ChestDecoGroup(props) {

    const {currentChest, setCurrentSkills, skills} = props;

    return (
        <div>
            <ArmorItem armorPiece={currentChest} setCurrentSkills={setCurrentSkills}></ArmorItem>
            <DecorationItem armorPiece={currentChest} skills={skills} setCurrentSkills={setCurrentSkills}></DecorationItem>
        </div>
    );
}
