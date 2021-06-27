import axios from "axios";
import { createContext, useReducer, useEffect } from "react";

export const BuilderDispatchContext = createContext();
export const BuilderStateContext = createContext();

export const BuilderContext = (props) => {
    // Initial Builder Page State
    const initialState = {
        armors: [],
        weapons: [],
        skills: [],
        weapon: {},
        helm: { skills: [] },
        chest: { skills: [] },
        arms: { skills: [] },
        coil: { skills: [] },
        legs: { skills: [] },
        loading: true,
        currentSkills: [],
        talismanSkills: [],
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
            talismanDeco1: {},
            talismanDeco2: {},
            talismanDeco3: {},
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

            // If there are any selected skills in the talisman skill array, add
            // them to the skill arrray list to be added to current skills
            if (state.talismanSkills.length > 0) {
                state.talismanSkills.forEach((skill) => {
                    skillArray.push(skill);
                });
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
        }

        console.log("An error setting the decoration has occurred");
        return state.decorations;
    };

    // This is a function to allow for the components 2 seconds to load onto the screen
    // after the data has been fetched
    // async function stall(stallTime = 2000) {
    //     await new Promise((resolve) => setTimeout(resolve, stallTime));
    // }

    // Reducer function
    const [state, dispatch] = useReducer(reducer, initialState);

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
            case "SET_SKILLS":
                return { ...state, skills: action.payload };
            case "SET_ARMORS":
                return { ...state, armors: action.payload };
            case "SET_WEAPONS":
                return { ...state, weapons: action.payload };
            // Use the current state present in the builder page to go over skills,
            // This means no dependency on state further down in components
            case "SET_CURRENT_SKILLS":
                return { ...state, currentSkills: populateSkills(state) };
            case "SET_DECORATION":
                return {
                    ...state,
                    decorations: handleDecorationSet(state, action.payload),
                };
            case "SET_TALISMAN_SKILLS":
                return { ...state, talismanSkills: action.payload };
            case "SET_LOADING":
                return { ...state, loading: action.payload };
            default:
                return state;
        }
    }

    // Do not like this but doing it to stop errors
    const fetchData = async (url, dispatchType) => {
        await axios
            .get(url)
            .then((res) => dispatch({ type: dispatchType, payload: res.data }));
    };

    // Gets the initial values from the api
    useEffect(() => {
        fetchData("http://localhost:5000/api/armor", "SET_ARMORS");
        fetchData("http://localhost:5000/api/weapon", "SET_WEAPONS");
        fetchData("http://localhost:5000/api/skill", "SET_SKILLS");
        dispatch({ type: "SET_LOADING", payload: false });
    }, []);

    // Set the initial values when the armor and weapon property gets data from api
    useEffect(() => {
        dispatch({ type: "SET_HELM", payload: state.armors[0] });
        dispatch({ type: "SET_CHEST", payload: state.armors[1] });
        dispatch({ type: "SET_ARMS", payload: state.armors[2] });
        dispatch({ type: "SET_COIL", payload: state.armors[3] });
        dispatch({ type: "SET_LEGS", payload: state.armors[4] });
        dispatch({
            type: "SET_CURRENT_SKILLS",
            payload: populateSkills(state),
        });
    }, [state.armors]);

    // Grabs the first weapon from the returned weapon array and sets it to currently equip weapon
    useEffect(() => {
        dispatch({ type: "SET_WEAPON", payload: state.weapons[0] });
    }, [state.weapons]);

    return (
        <BuilderDispatchContext.Provider value={dispatch}>
            <BuilderStateContext.Provider value={state}>
                {props.children}
            </BuilderStateContext.Provider>
        </BuilderDispatchContext.Provider>
    );
};
