import React, { useContext } from "react";
import { BuilderStateContext } from "../../../../Contexts/BuilderContext";
import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function ChestDecoGroup(props) {
    const { setCurrentSkills } = props;
    const state = useContext(BuilderStateContext);

    return (
        <div>
            <ArmorItem
                armorPiece={state.chest}
                setCurrentSkills={setCurrentSkills}
            ></ArmorItem>
            <DecorationItem
                equipment={state.chest}
                setCurrentSkills={setCurrentSkills}
            ></DecorationItem>
        </div>
    );
}
