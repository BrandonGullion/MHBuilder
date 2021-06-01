import React, { useEffect, useState } from "react";
import axios from "axios";
import Dropdown from "react-dropdown";
import "react-dropdown/style.css";

export default function DeveloperPage() {
    // Generates a list of skills to select
    const [skillList, setSkillList] = useState([]);
    const [skillListOptions, setSkillListOptions] = useState([]);

    // Populate skill data at start of page loading
    useEffect(() => {
        // Gets a list of skills to be displayed in the select tag
        axios.get("http://localhost:5000/api/skill").then((response) => {
            setSkillList(response.data);
        });
    }, []);

    // Whenever the skill list is updated, then the skill list options will be updated
    useEffect(() => {
        skillList.sort((a,b) => a.name > b.name ? 1 : -1);
        skillList.forEach((skill) => {
            setSkillListOptions((prevArray) => [
                ...prevArray,
                { key: skill.id, value: skill.id, label: skill.name },
            ]);
        });
    }, [skillList]);

    // Submits armor to the db
    const handleArmorSubmit = () => {
        console.log("Submitting armor to server");

        console.log(armor);

        axios
            .post("http://localhost:5000/api/armor", armor)
            .then((response) => console.log(response));
    };
    // Submits new skill to db
    const handleSkillSubmit = () => {
        console.log("Post request made");
        axios
            .post("http://localhost:5000/api/skill", skill)
            .then((response) => console.log(response));
    };

    // Skill type array for skill drop down menu
    const skillTypeOptions = [
        { key: "at", value: "Attack", text: "Attack" },
        { key: "af", value: "Affinity", text: "Affinity" },
        { key: "def", value: "Defense", text: "Defense" },
        { key: "fr", value: "FireRes", text: "Fire Resistance" },
        { key: "wr", value: "WaterRes", text: "Water Resistance" },
        { key: "tr", value: "ThunderRes", text: "Thunder Resistance" },
        { key: "ic", value: "IceRes", text: "Ice Resistance" },
        { key: "dr", value: "DragonRes", text: "Dragon Resistance" },
    ];

    // Beginning Instance of skill
    const skill = {
        name: "",
        type: "",
        description: "",
        stats: "",
        statType: "",
        maxLevel: "",
    };

    // Armor to be passed to the database
    const armor = {
        name: "",
        type: "",
        rarity: 1,
        armorSetId: 0,
        armorSetName: "",
        defense: 0,
        fireRes: 0,
        waterRes: 0,
        thunderRes: 0,
        iceRes: 0,
        dragonRes: 0,
        decoSlot1Lvl: 0,
        decoSlot2Lvl: 0,
        decoSlot3Lvl: 0,
        stringSkills: "",
        rank: "",
    };

    return (
        <div
            style={{
                color: "white",
                padding: "20px",
                display: "flex",
            }}
        >
            {/* Add new armor div  */}
            <div>
                <label>Add new Armor</label>
                <div style={{ display: "flex", flexDirection: "column" }}>
                    <label>Name</label>
                    <input onChange={(e) => (armor.name = e.target.value)} />
                    <label>Type</label>
                    <input onChange={(e) => (armor.type = e.target.value)} />
                    <label>Rarity</label>
                    <input
                        type="number"
                        onChange={(e) => (armor.rarity = e.target.value)}
                    />
                    <label>Armor Set Id</label>
                    <input
                        type="number"
                        onChange={(e) => (armor.armorSetId = e.target.value)}
                    />
                    <label>Armor Set Name</label>
                    <input
                        onChange={(e) => (armor.armorSetName = e.target.value)}
                    />
                    <label>Defense</label>
                    <input
                        type="number"
                        onChange={(e) => (armor.defense = e.target.value)}
                    />
                    <label>Fire Res</label>
                    <input
                        type="number"
                        onChange={(e) => (armor.fireRes = e.target.value)}
                    />
                    <label>Water Res</label>
                    <input
                        type="number"
                        onChange={(e) => (armor.waterRes = e.target.value)}
                    />
                    <label>Thunder Res</label>
                    <input
                        type="number"
                        onChange={(e) => (armor.thunderRes = e.target.value)}
                    />
                    <label>Ice Res</label>
                    <input
                        type="number"
                        onChange={(e) => (armor.iceRes = e.target.value)}
                    />
                    <label>Dragon Res</label>
                    <input
                        type="number"
                        onChange={(e) => (armor.dragonRes = e.target.value)}
                    />

                    <button
                        onClick={handleArmorSubmit}
                        style={{ marginTop: "10px" }}
                    >
                        Submit
                    </button>
                </div>
            </div>
            <div
                style={{
                    display: "flex",
                    flexDirection: "column",
                    marginTop: "32px",
                    position: "relative",
                    left: "10px",
                }}
            >
                <label>Deco Slot 1</label>
                <input
                    type="number"
                    onChange={(e) => (armor.decoSlot1Lvl = e.target.value)}
                />
                <label>Deco Slot 2</label>
                <input
                    type="number"
                    onChange={(e) => (armor.decoSlot2Lvl = e.target.value)}
                />
                <label>Deco Slot 3</label>
                <input
                    type="number"
                    onChange={(e) => (armor.decoSlot3Lvl = e.target.value)}
                />

                <label>High or Low rank</label>
                <input onChange={(e) => (armor.rank = e.target.value)}></input>

                <label>Skills</label>
                {/* Create the select list of skills for armor */}
                <Dropdown
                    options={skillListOptions}
                    placeholder="Skills"
                    onChange={(e) =>
                        (armor.stringSkills =
                            armor.stringSkills + e.value + "*")
                    }
                ></Dropdown>

                <button onClick={() => (armor.stringSkills = "")}>
                    Clear Skills
                </button>

                <button onClick={() => console.log(armor)}>Validate</button>
            </div>
            {/* Add Skill Div */}
            <div style={{ marginLeft: "20px", width: "300px" }}>
                <label>Add new skill</label>
                <div style={{ display: "flex", flexDirection: "column" }}>
                    <label>Name</label>
                    <input
                        onChange={(e) => (skill.name = e.target.value)}
                    ></input>
                    <label>Type</label>
                    <input
                        onChange={(e) => (skill.type = e.target.value)}
                    ></input>
                    <label>Description</label>
                    <textarea
                        style={{ fontSize: "14px", height: "100px" }}
                        onChange={(e) => (skill.description = e.target.value)}
                    ></textarea>
                    <label>Stats</label>
                    <textarea
                        style={{ height: "200px", fontSize: "14px" }}
                        onChange={(e) => (skill.stats = e.target.value)}
                    ></textarea>
                    {/* Selects which stat will be altered for the stats window */}
                    <label>Stat Type</label>
                    <Dropdown
                        placeholder="Select Skill Type"
                        onChange={(e) => {
                            skill.type = e.value;
                            console.log(skill.type);
                        }}
                        options={skillTypeOptions}
                    ></Dropdown>

                    <label>Max Level</label>
                    <input
                        type="number"
                        onChange={(e) => (skill.maxLevel = e.target.value)}
                    ></input>
                    <button onClick={() => console.log(skill)}>Validate</button>
                    <button
                        style={{ marginTop: "10px" }}
                        onClick={() => handleSkillSubmit()}
                    >
                        Submit
                    </button>
                </div>
            </div>
        </div>
    );
}
