import React, { useEffect, useState } from "react";
import SkillItem from "./SkillItem";
import StatItem from "./StatItem";

// Takes in a skill array, producing an array of skill objects that correlate
// the skills level along with the skill data.
export const filterSkills = (skillsArray, setCurrentSkills) => {
    // Clear out the filtered array when the components are re-rendered
    let tempSkillArray = [];
    let duplicate = false;
    let index = 0;

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

export default function Stats(props) {
    const { state } = props;
    const { helm, chest, arms, coil, legs, weapon, skills } = state;

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

            setCurrentStats((prevStats) => {
                return {
                    ...prevStats,
                    attack:initialStats.attack,
                    defense: initialStats.defense,
                    fireRes: initialStats.fRes,
                    waterRes:initialStats.wRes,
                    thunderRes:initialStats.tRes,
                    iceRes:initialStats.iRes, 
                    dragonRes:initialStats.dRes
                };
            });
        };

        populateStats();
        filterSkills(skills, setFilteredSkills);
    }, [state, weapon, helm, arms, chest, coil, legs, skills]);

    return (
        <div className="glass-card stats-container">
            <div className="glass-card-header">
                <h2>Stats</h2>
            </div>
            <div
                className="glass-card-content"
                style={{ display: "flex", flexDirection: "column" }}
            >
                <StatItem
                    statName="Attack"
                    value={currentStats.attack}
                ></StatItem>
                <StatItem
                    statName="Defense"
                    value={currentStats.defense}
                ></StatItem>
                <div className="dotted-linebreak"></div>
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

                <br />
                <h3>Skills</h3>
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
