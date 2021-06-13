import React, { useState } from "react";
import WeaponItem from "../CurrentEquipmentComponents/WeaponItem";
import { ComboBoxComponent } from "@syncfusion/ej2-react-dropdowns";

export default function WeaponTabContent(props) {
    // Weapon api data and useReducer dispatch
    const { weapons, dispatch } = props;

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
    const weaponArrays = {
        gsArray: [],
        snsArray: [],
        dbArray: [],
        lsArray: [],
        haArray: [],
        saArray: [],
        laArray: [],
        glArray: [],
        boArray: [],
        cbArray: [],
        igArray: [],
        hhArray: [],
        lbArray: [],
        hbArray: [],
    };

    // Filters the weapons into their seperate arrays
    weapons.forEach((weapon) => {
        switch (weapon.type) {
            case weaponTypes.sns:
                weaponArrays.snsArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            key={weapon.id}
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;
            case weaponTypes.gs:
                weaponArrays.gsArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            key={weapon.id}
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;
            case weaponTypes.db:
                weaponArrays.dbArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            key={weapon.id}
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;
            case weaponTypes.ls:
                weaponArrays.lsArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            key={weapon.id}
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;
            case weaponTypes.ha:
                weaponArrays.haArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            key={weapon.id}
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;
            case weaponTypes.hh:
                weaponArrays.hhArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            key={weapon.id}
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;
            case weaponTypes.la:
                weaponArrays.laArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            key={weapon.id}
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;
            case weaponTypes.gl:
                weaponArrays.glArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            key={weapon.id}
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;
            case weaponTypes.sa:
                weaponArrays.saArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            key={weapon.id}
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;
            case weaponTypes.cb:
                weaponArrays.cbArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            key={weapon.id}
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;
            case weaponTypes.ig:
                weaponArrays.igArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            key={weapon.id}
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;
            case weaponTypes.bo:
                weaponArrays.boArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            key={weapon.id}
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;
            case weaponTypes.hb:
                weaponArrays.hbArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;
            case weaponTypes.lb:
                weaponArrays.lbArray.push(
                    <div key={weapon.id} className="white-border-hover">
                        <WeaponItem
                            key={weapon.id}
                            weapon={weapon}
                            dispatch={dispatch}
                        ></WeaponItem>
                    </div>
                );
                break;

            default:
                break;
        }
    });

    // Returns an array of weapon items depending on the selected
    // Weapon type
    const renderWeapons = (desiredWeaponType) => {
        switch (desiredWeaponType) {
            case weaponTypes.gs:
                return weaponArrays.gsArray;
            case weaponTypes.sns:
                return weaponArrays.snsArray;
            case weaponTypes.db:
                return weaponArrays.dbArray;
            case weaponTypes.ls:
                return weaponArrays.lsArray;
            case weaponTypes.ha:
                return weaponArrays.haArray;
            case weaponTypes.hh:
                return weaponArrays.hhArray;
            case weaponTypes.la:
                return weaponArrays.laArray;
            case weaponTypes.gl:
                return weaponArrays.glArray;
            case weaponTypes.sa:
                return weaponArrays.saArray;
            case weaponTypes.cb:
                return weaponArrays.cbArray;
            case weaponTypes.ig:
                return weaponArrays.igArray;
            case weaponTypes.bo:
                return weaponArrays.boArray;
            case weaponTypes.hb:
                return weaponArrays.hbArray;
            case weaponTypes.lb:
                return weaponArrays.lbArray;
            default:
                break;
        }
    };

    return (
        <div style={{overflowY:"scroll", maxHeight:"700px"}}>
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
