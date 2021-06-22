import React, { useContext } from "react";
import { BuilderStateContext } from "../../../../Contexts/BuilderContext";
import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function CoilDecoGroup(props) {
    const { setCurrentSkills } = props;
    const state = useContext(BuilderStateContext);

    return (
        <div>
            <ArmorItem
                armorPiece={state.coil}
                setCurrentSkills={setCurrentSkills}
            ></ArmorItem>
            <DecorationItem
                equipment={state.coil}
                setCurrentSkills={setCurrentSkills}
            ></DecorationItem>
        </div>
    );
}
