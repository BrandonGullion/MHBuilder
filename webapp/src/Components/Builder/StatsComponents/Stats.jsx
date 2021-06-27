import React, { useContext, useEffect, useState } from "react";
import { BuilderStateContext } from "../../../Contexts/BuilderContext";
import SkillItem from "./SkillItem";
import StatItem from "./StatItem";

// Takes in a skill array, producing an array of skill objects that correlate
// the skills level along with the skill data.
export const filterSkills = (skillsArray, setCurrentSkills) => {
    // Clear out the filtered array when the components are re-rendered
    let tempSkillArray = [];
    let duplicate = false;
    let index = 0;

    // Order the skills before creating the skillObject template for skill item components
    skillsArray.sort((a,b) => (a.name > b.name ? 1 : -1));

    // loop over to prepare skills
    for (let i = 0; i < skillsArray.length; i++) {
        duplicate = false;
        index = 0;

        for (let j = 0; j < tempSkillArray.length; j++) {
            // increment if already there
            if (skillsArray[i].id === tempSkillArray[j].skill.id) {
                duplicate = true;
                index = j;
            }
        }

        // If duplicate present, use stored index to update count, else add to array
        if (duplicate) {
            tempSkillArray[index].count++;
        } else {
            tempSkillArray.push({ skill: skillsArray[i], count: 1 });
        }
        // Add new if not already present using index id and duplicate var
    }
    // Set the array so components can update
    setCurrentSkills(tempSkillArray);
};

export default function Stats() {
    const state = useContext(BuilderStateContext);
    const { helm, chest, arms, coil, legs, weapon, currentSkills } = state;

    const [currentStats, setCurrentStats] = useState({});
    const [filteredSkills, setFilteredSkills] = useState([]);

    // Tracking state so that when a value changes ie. equipment, then it will
    // re-calc the values
    useEffect(() => {
        // Checking if the armor pieces have been loaded
        if (helm === undefined || weapon === undefined) {
            return;
        }

        // Populate stats currently affects the currentStats, and is causing too
        // many re-renders, trying to figure out how to fix this
        const populateStats = () => {
            // Destructure and prepare array for mapping
            let armorArray = [helm, chest, arms, coil, legs];

            let initialStats = {
                defense: 0,
                attack: 0,
                affinity: 0,
                fRes: 0,
                wRes: 0,
                tRes: 0,
                iRes: 0,
                dRes: 0,
            };

            // Map over array preparing the defenses

            armorArray.forEach((equipment) => {
                initialStats.defense += equipment.defense;
                initialStats.fRes += equipment.fireRes;
                initialStats.wRes += equipment.waterRes;
                initialStats.tRes += equipment.thunderRes;
                initialStats.iRes += equipment.iceRes;
                initialStats.dRes += equipment.dragonRes;
            });

            initialStats.attack += state.weapon.damage;
            initialStats.affinity += state.weapon.affinity;

            setCurrentStats((prevStats) => {
                return {
                    ...prevStats,
                    attack: initialStats.attack,
                    affinity: initialStats.affinity,
                    defense: initialStats.defense,
                    fireRes: initialStats.fRes,
                    waterRes: initialStats.wRes,
                    thunderRes: initialStats.tRes,
                    iceRes: initialStats.iRes,
                    dragonRes: initialStats.dRes,
                };
            });
        };

        populateStats();
        filterSkills(currentSkills, setFilteredSkills);
    }, [state, weapon, helm, arms, chest, coil, legs, currentSkills]);

    return (
        <div style={{ width: "300px" }}>
            <div
                style={{ color: "#ccc", margin: "15px 0px 0px 5px" }}
                className="glass-card-header"
            >
                <h2 className="pad-left-10">Stats</h2>
            </div>
            <div
                className="glass-card glass-card-content"
                style={{
                    display: "flex",
                    flexDirection: "column",
                    margin: "5px 0px 0px 5px",
                }}
            >
                <StatItem
                    statName="Attack"
                    value={currentStats.attack}
                ></StatItem>
                <StatItem
                    statName="Defense"
                    value={currentStats.defense}
                ></StatItem>
                <StatItem
                    statName="Affinity"
                    value={currentStats.affinity}
                ></StatItem>
            </div>

            <div
                style={{ color: "#ccc", margin: "5px 0 0 5px" }}
                className="glass-card-header"
            >
                <h2 className="pad-left-10">Resistances</h2>
            </div>
            <div
                style={{ margin: "5px 0 0 5px" }}
                className="glass-card glass-card-content"
            >
                <StatItem
                    statName="Fire Resistance"
                    value={currentStats.fireRes}
                ></StatItem>
                <StatItem
                    statName="Water Resistance"
                    value={currentStats.waterRes}
                ></StatItem>
                <StatItem
                    statName="Thunder Resistance"
                    value={currentStats.thunderRes}
                ></StatItem>
                <StatItem
                    statName="Ice Resistance"
                    value={currentStats.iceRes}
                ></StatItem>
                <StatItem
                    statName="Dragon Resistance"
                    value={currentStats.dragonRes}
                ></StatItem>
            </div>
            <div
                style={{ color: "#ccc", margin: "5px 0 0 5px" }}
                className="glass-card-header"
            >
                <h2 className="pad-left-10">Skills</h2>
            </div>
            <div
                style={{
                    margin: "5px 0 0 5px",
                    height: "364px",
                    overflow: "scroll",
                }}
                className="glass-card glass-card-content"
            >
                {filteredSkills.map((skillObject) => (
                    <SkillItem
                        key={skillObject.skill.name}
                        skillObject={skillObject}
                    ></SkillItem>
                ))}
            </div>
        </div>
    );
}
