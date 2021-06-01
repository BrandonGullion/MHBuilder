import React from "react";
import DecorationItem from "../DecorationItem";
import WeaponItem from "../WeaponItem";

export default function WeaponDecoGroup(props) {
    const { currentWeapon } = props;

    // Only render if the weapon is not undefined... idfk why this keeps happening when
    // whole page should only render when all api data is loaded... love js
    return <div>
        <WeaponItem weapon={currentWeapon}></WeaponItem>
        <DecorationItem armorPiece={currentWeapon}></DecorationItem>
    </div>;
}
