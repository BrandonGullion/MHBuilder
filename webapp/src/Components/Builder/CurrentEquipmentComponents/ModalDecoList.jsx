import React from "react";
import { Fragment } from "react";

// Try to use the context to get access to the dispatch
export default function ModalDecoList(props){
    const {modalState, dispatch, skills} = props;

    console.log(skills);
    return <div>

        {skills.map((skill) => {
            <div style={{display:"inline-block" }} key={skill.id}>
                <div>{skill.jewelName}</div>
                <div>{skill.name}</div>
                <div>{skill.description}</div>
            </div>
        })}


    </div>
}