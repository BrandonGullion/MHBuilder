import React from "react";
import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function ChestDecoGroup(props) {
    const { currentChest, setCurrentSkills, skills, dispatch } = props;

    return (
        <div>
            <ArmorItem
                armorPiece={currentChest}
                setCurrentSkills={setCurrentSkills}
            ></ArmorItem>
            <DecorationItem
                dispatch={dispatch}
                armorPiece={currentChest}
                skills={skills}
                setCurrentSkills={setCurrentSkills}
            ></DecorationItem>
        </div>
    );
}
