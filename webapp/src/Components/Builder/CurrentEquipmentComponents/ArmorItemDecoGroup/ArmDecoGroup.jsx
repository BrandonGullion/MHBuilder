import React from "react";
import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function ArmDecoGroup(props) {
    const { setCurrentSkills, currentArms, skills, dispatch } = props;

    return (
        <div>
            <ArmorItem
                armorPiece={currentArms}
                setCurrentSkills={setCurrentSkills}
            ></ArmorItem>
            <DecorationItem
                dispatch={dispatch}
                armorPiece={currentArms}
                skills={skills}
                setCurrentSkills={setCurrentSkills}
            ></DecorationItem>
        </div>
    );
}
