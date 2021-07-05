import React, { useContext, useEffect, useState } from "react";
import WeaponItem from "../CurrentEquipmentComponents/WeaponItem";
import { ComboBoxComponent } from "@syncfusion/ej2-react-dropdowns";
import { BuilderStateContext } from "../../../Contexts/BuilderContext";
import Dropdown from "react-dropdown";
import "react-dropdown/style.css";

export default function WeaponTabContent() {
    const state = useContext(BuilderStateContext);

    // Search criteria that will be used for each weapon
    const [searchCriteria, setSearchCriteria] = useState({
        value: "",
        weaponProp: "",
        ascOrDes: "",
    });

    const [desiredWeaponArray, setDesiredWeaponArray] = useState([]);
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

    const weaponPropOptions = [
        { key: "1", value: "Damage", text: "Attack" },
        { key: "2", value: "Name", text: "Name" },
    ];

    const test = weaponPropOptions[0];
    const sortingDirectionOptions = [
        { key: "1", value: "Ascending", text: "Ascending" },
        { key: "2", value: "Descending", text: "Descending" },
    ];

    const [desiredWeaponType, setDesiredWeaponType] = useState(weaponTypes.sns);
    const weaponFields = { text: "text", value: "value" };

    // Used to change what array is being displayed

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
                <WeaponItem key={weapon.id} weapon={weapon}></WeaponItem>
            </div>
        );
    });

    // Sort function when search is being used
    const searchWeapons = (desiredWeaponArray, searchCriteria) => {
        // This will stop the search function from running when the program
        // is loading all of its components
        if (desiredWeaponArray === undefined) {
            return [];
        }

        // Set default search params if they have not been selected by user
        if (
            searchCriteria.weaponProp === "" ||
            searchCriteria.weaponProp === undefined
        ) {
            searchCriteria.weaponProp = "Name";
        }
        if (
            searchCriteria.ascOrDes === "" ||
            searchCriteria.ascOrDes === undefined
        ) {
            searchCriteria.ascOrDes = "Ascending";
        }

        // If the search criteria is currently filled, and then the value is switched to damage, make sure
        // to null out the value or else it will crash
        if (
            searchCriteria.value !== "" &&
            searchCriteria.weaponProp === "damage"
        ) {
            searchCriteria.value = "";
            setSearchCriteria(searchCriteria);
        }

        // Sorts the array based on the selected property
        if (searchCriteria.value !== "") {
            desiredWeaponArray = desiredWeaponArray.filter((item) =>
                item.props.children.props.weapon[
                    `${searchCriteria.weaponProp.toLowerCase()}`
                ]
                    .toLowerCase()
                    .includes(searchCriteria.value.toLowerCase())
            );
            console.log(desiredWeaponArray);
        }

        // Ascending or Descending
        if (searchCriteria.ascOrDes === "Ascending") {
            return desiredWeaponArray.sort((a, b) =>
                a.props.children.props.weapon[
                    `${searchCriteria.weaponProp.toLowerCase()}`
                ] >
                b.props.children.props.weapon[
                    `${searchCriteria.weaponProp.toLowerCase()}`
                ]
                    ? 1
                    : -1
            );
        } else if (searchCriteria.ascOrDes === "Descending") {
            return desiredWeaponArray.sort((a, b) =>
                a.props.children.props.weapon[
                    `${searchCriteria.weaponProp.toLowerCase()}`
                ] >
                b.props.children.props.weapon[
                    `${searchCriteria.weaponProp.toLowerCase()}`
                ]
                    ? -1
                    : 1
            );
        } else {
            console.log("You should not be here");
        }
    };

    // Returns an array of weapon items depending on the selected
    // Weapon type

    const renderWeapons = (desiredWeaponType, searchCriteria) => {
        // return an array of sorted items depending on the search criteria
        if (searchCriteria.value !== undefined) {
            setDesiredWeaponArray(
                searchWeapons(weaponArrays[desiredWeaponType], searchCriteria)
            );
        } else {
            setDesiredWeaponArray(weaponArrays[desiredWeaponType]);
        }
    };

    // This will re-render the list of weapons each time there is a change
    useEffect(() => {
        renderWeapons(desiredWeaponType, searchCriteria);
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [searchCriteria, desiredWeaponType, weapons]);

    return (
        <div style={{ height: "669px" }}>
            <div
                style={{
                    padding: "10px 10px",
                }}
            >
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
            <div
                style={{
                    display: "flex",
                    padding: "0px 0 0 9px",
                }}
            >
                <Dropdown
                    className="weapon-prop-dropdown"
                    placeholder="Type"
                    options={weaponPropOptions}
                    onChange={(e) =>
                        setSearchCriteria((prev) => {
                            return {
                                ...prev,
                                weaponProp: e.value.toLowerCase(),
                            };
                        })
                    }
                ></Dropdown>
                <div style={{ margin: "0px 10px" }}>
                    <Dropdown
                        className="weapon-prop-dropdown"
                        placeholder="Direction"
                        options={sortingDirectionOptions}
                        onChange={(e) =>
                            setSearchCriteria((prev) => {
                                return {
                                    ...prev,
                                    ascOrDes: e.value,
                                };
                            })
                        }
                    ></Dropdown>
                </div>
                <input
                    style={{ width: "130px", margin: "0" }}
                    className="default-input"
                    disabled={
                        searchCriteria.weaponProp === "damage" ? true : false
                    }
                    placeholder="Search"
                    onChange={(e) => {
                        setSearchCriteria((prev) => {
                            return { ...prev, value: e.target.value };
                        });
                    }}
                ></input>
            </div>
            <div
                style={{
                    overflowY: "scroll",
                    position: "relative",
                    height: "585px",
                    marginTop: "15px",
                    overflowX: "hidden",
                }}
            >
                {desiredWeaponArray}
            </div>
        </div>
    );
}
