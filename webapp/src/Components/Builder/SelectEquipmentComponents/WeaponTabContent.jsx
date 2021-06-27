import React, { useContext, useState } from "react";
import WeaponItem from "../CurrentEquipmentComponents/WeaponItem";
import { ComboBoxComponent } from "@syncfusion/ej2-react-dropdowns";
import { BuilderStateContext } from "../../../Contexts/BuilderContext";


export default function WeaponTabContent() {
    const state = useContext(BuilderStateContext);

    // Weapon api data and useReducer dispatch
    const { weapons } = state;

    // Weapon type for quick access
    const weaponTypes = {
        gs: "GreatSword",
        sns: "SwordAndShield",
        db: "DualBlades",
        ls: "LongSword",
        ha: "Hammer",
        sa: "SwitchAxe",
        la: "Lance",
        gl: "GunLance",
        bo: "Bow",
        cb: "ChargeBlade",
        ig: "InsectGlaive",
        hh: "HuntingHorn",
        lb: "LightBowgun",
        hb: "HeavyBowgun",
    };

    const weaponTypeOptions = [
        { value: weaponTypes.gs, text: "Great Sword" },
        { value: weaponTypes.sns, text: "Sword and Shield" },
        { value: weaponTypes.db, text: "Dual Blades" },
        { value: weaponTypes.ls, text: "Longsword" },
        { value: weaponTypes.ha, text: "Hammer" },
        { value: weaponTypes.sa, text: "Switch Axe" },
        { value: weaponTypes.la, text: "Lance" },
        { value: weaponTypes.gl, text: "Gun Lance" },
        { value: weaponTypes.bo, text: "Bow" },
        { value: weaponTypes.cb, text: "Charge Blade" },
        { value: weaponTypes.ig, text: "Insect Glaive" },
        { value: weaponTypes.hh, text: "Hunting Horn" },
        { value: weaponTypes.lb, text: "Light Bowgun" },
        { value: weaponTypes.hb, text: "Heavy Bowgun" },
    ];

    const weaponFields = { text: "text", value: "value" };

    // Used to change what array is being displayed
    const [desiredWeaponType, setDesiredWeaponType] = useState(weaponTypes.sns);

    // Object to hold all different weapon arrays
    const weaponArrays = {};

    // Filters the weapons into their seperate arrays
    // This could be made smaller by using string to id props...
    weapons.forEach((weapon) => {
        // Create a new instance of an array if there is not one already present
        if (weaponArrays[`${weapon.type}`] === undefined) {
            weaponArrays[`${weapon.type}`] = [];
        }
        weaponArrays[`${weapon.type}`].push(
            <div key={weapon.id} className="white-border-hover">
                <WeaponItem
                    key={weapon.id}
                    weapon={weapon}
                ></WeaponItem>
            </div>
        );
    });

    // Returns an array of weapon items depending on the selected
    // Weapon type

    const renderWeapons = (desiredWeaponType) => {
        return weaponArrays[desiredWeaponType];
    };

    return (
        <div style={{ overflowY: "scroll", maxHeight: "669px" }}>
            <div style={{ padding: "10px 10px" }}>
                <ComboBoxComponent
                    fields={weaponFields}
                    value={desiredWeaponType}
                    change={(e) =>
                        setDesiredWeaponType(
                            e.value !== null ? e.value : weaponTypes.sns
                        )
                    }
                    dataSource={weaponTypeOptions}
                ></ComboBoxComponent>
            </div>
            <div>{renderWeapons(desiredWeaponType)}</div>
        </div>
    );
}
