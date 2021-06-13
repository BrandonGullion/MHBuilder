import React from "react";
import DecorationItem from "../DecorationItem";
import CurrentWeaponItem from "./CurrentWeaponItem";

export default function WeaponDecoGroup(props) {
    const { currentWeapon, skills } = props;

    // Only render if the weapon is not undefined... idfk why this keeps happening when
    // whole page should only render when all api data is loaded... love js
    if (currentWeapon === undefined) {
        return <div></div>;
    }

    return (
        <div>
            <CurrentWeaponItem weapon={currentWeapon}></CurrentWeaponItem>
            <DecorationItem armorPiece={currentWeapon} skills={skills}></DecorationItem>
        </div>
    );
}
