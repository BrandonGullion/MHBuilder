import React, { useEffect, useState } from "react";

export default function SkillPopUp(props) {
    const { skillObject } = props;
    const { skill, count } = skillObject;

    const [skillDescriptions, setSkillDescriptions] = useState([]);

    useEffect(() => {
        const generateSkillDescription = () => {
            if (skill !== undefined) {
                setSkillDescriptions(skill.stats.split("*"));
            }
        };
        generateSkillDescription();
    }, [skill]);

    return (
        <div className="skill-popup">
            {skillDescriptions.map((description, index) => (
                <div key={index} style={index + 1 === count ? {color:"#00adb5"}:{}}>
                    <label>Level {index + 1}</label>
                    <p style={{ fontSize: "14px" }}>{description}</p>
                    {index < skillDescriptions.length - 1 ? (
                        <div className="dotted-linebreak"
                        style={{margin:"10px 0px 0px 0px"}}></div>
                    ) : (
                        <div></div>
                    )}
                </div>
            ))}
        </div>
    );
}
