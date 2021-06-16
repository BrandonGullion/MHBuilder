import React, { useState, useEffect, useReducer } from "react";
import CurrentEquipment from "../Components/Builder/CurrentEquipmentComponents/CurrentEquipment";
import SelectEquipment from "../Components/Builder/SelectEquipmentComponents/SelectEquipment";
import Stats from "../Components/Builder/StatsComponents/Stats";
import { getDataFromApi } from "../Api/agent";

export default function BuilderPage() {
    // These are to be populated by the api
    const [armors, setArmors] = useState([]);
    const [weapons, setWeapons] = useState([]);
    const [skills, setSkills] = useState([]);

    // Initial Builder Page State
    const initialState = {
        armors: [],
        skills: [],
        weapon: {},
        helm: { skills: [] },
        chest: { skills: [] },
        arms: { skills: [] },
        coil: { skills: [] },
        legs: { skills: [] },
        currentSkills: [],
        decorations: {
            weaponDeco1: {},
            weaponDeco2: {},
            weaponDeco3: {},
            helmDeco1: {},
            helmDeco2: {},
            helmDeco3: {},
            chestDeco1: {},
            chestDeco2: {},
            chestDeco3: {},
            armsDeco1: {},
            armsDeco2: {},
            armsDeco3: {},
            coilDeco1: {},
            coilDeco2: {},
            coilDeco3: {},
            legsDeco1: {},
            legsDeco2: {},
            legsDeco3: {},
        },
    };

    /* Gathers all of the skills from each armor component and decorations
     * This must be called before the reducer function so that the
     * Function is loaded before getting called
     */
    const populateSkills = (state) => {
        let skillArray = [];

        // Required to determine if the armor array has been loaded and is
        // not undefined ** Re-Rendering troubles **
        if (state.helm !== undefined) {
            const { helm, chest, arms, coil, legs } = state;
            let tempArray = [helm, chest, arms, coil, legs];

            tempArray.forEach((item) => {
                if (item.skills.length > 0) {
                    item.skills.forEach((skill) => {
                        skillArray.push(skill);
                    });
                }
            });

            /* Goes over all of the decoration properties in the state and adds any present 
               skills to the skills list to be returned */
            for (const property in state.decorations) {
                if (state.decorations[property].name !== undefined) {
                    skillArray.push(state.decorations[property]);
                }
            }
        }
        return skillArray;
    };

    /* Takes in the current state, and desired decoration to be set from modal
    sets decoration based on which button was selected, payload is an object containing
    both the selected skill and the button id that will be used to determine which 
    property in the state will be updated */

    const handleDecorationSet = (state, payload) => {
        const { equipment, slotNumber, skill } = payload;

        // preps the property for the decoration state
        let prop = `${equipment.type
            .charAt(0)
            .toLowerCase()}${equipment.type.slice(1)}Deco${slotNumber}`;

        if (skill !== undefined) {
            state.decorations[prop] = skill;
            state.skills.push(skill);
            return state.decorations;
        } else {
            console.log("An error setting the decoration has occurred");
            return state.decorations;
        }
    };

    // Reducer function
    const [state, dispatch] = useReducer(reducer, initialState);
    const { helm, chest, arms, coil, legs, weapon } = state;

    // Reducer function for entire armor page
    function reducer(state, action) {
        switch (action.type) {
            case "SET_HELM":
                return { ...state, helm: action.payload };
            case "SET_CHEST":
                return { ...state, chest: action.payload };
            case "SET_ARMS":
                return { ...state, arms: action.payload };
            case "SET_COIL":
                return { ...state, coil: action.payload };
            case "SET_LEGS":
                return { ...state, legs: action.payload };
            case "SET_WEAPON":
                return { ...state, weapon: action.payload };
            // Use the current state present in the builder page to go over skills,
            // This means no dependency on state further down in components
            case "SET_CURRENT_SKILLS":
                return { ...state, currentSkills: populateSkills(state) };
            case "SET_DECORATION":
                return {
                    ...state,
                    decorations: handleDecorationSet(state, action.payload),
                };
            default:
                return state;
        }
    }

    // Gets the initial values from the api
    useEffect(() => {
        getDataFromApi("http://localhost:5000/api/armor", setArmors);
        getDataFromApi("http://localhost:5000/api/weapon", setWeapons);
        getDataFromApi("http://localhost:5000/api/skill", setSkills);
    }, []);

    // Set the initial values when the armor and weapon property gets data from api
    useEffect(() => {
        dispatch({ type: "SET_HELM", payload: armors[0] });
        dispatch({ type: "SET_CHEST", payload: armors[1] });
        dispatch({ type: "SET_ARMS", payload: armors[2] });
        dispatch({ type: "SET_COIL", payload: armors[3] });
        dispatch({ type: "SET_LEGS", payload: armors[4] });
        dispatch({
            type: "SET_CURRENT_SKILLS",
            payload: populateSkills(state),
        });
    }, [armors]);

    // Grabs the first weapon from the returned weapon array and sets it to currently equip weapon
    useEffect(() => {
        dispatch({ type: "SET_WEAPON", payload: weapons[0] });
    }, [weapons]);

    // Check if items are loaded before loading dependent components
    if (
        helm === undefined &&
        chest === undefined &&
        arms === undefined &&
        coil === undefined &&
        legs === undefined &&
        weapon === undefined
    ) {
        // Replace with a dimmer that will disapear when the data is loaded
        return <div>Loading</div>;
    }

    // Components that are loaded only when data is present
    return (
        <div className="builder-page row">
            <CurrentEquipment
                skills={skills}
                dispatch={dispatch}
                currentWeapon={weapon}
                currentHelm={helm}
                currentChest={chest}
                currentArms={arms}
                currentCoil={coil}
                currentLegs={legs}
            ></CurrentEquipment>
            <SelectEquipment
                weapons={weapons}
                armors={armors}
                dispatch={dispatch}
            ></SelectEquipment>
            <Stats state={state}></Stats>
            <button onClick={() => console.log(state)}>Check state</button>
        </div>
    );
}
