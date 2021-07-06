import React, { useContext } from "react";
import { BuilderStateContext } from "../../../../Contexts/BuilderContext";
import DecorationItem from "../DecorationItem";
import CurrentWeaponItem from "./CurrentWeaponItem";

export default function WeaponDecoGroup(props) {
    const { skills } = props;

    const state = useContext(BuilderStateContext);

    // Only render if the weapon is not undefined... idfk why this keeps happening when
    // whole page should only render when all api data is loaded... love js
    if (state.weapon === undefined) {
        return <div></div>;
    }

    return (
        <div>
            <CurrentWeaponItem weapon={state.weapon}></CurrentWeaponItem>
            <DecorationItem
                equipment={state.weapon}
                skills={skills}
            ></DecorationItem>
        </div>
    );
}
