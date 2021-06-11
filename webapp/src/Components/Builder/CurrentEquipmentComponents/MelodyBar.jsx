import React from "react";
import { MdMusicNote } from "react-icons/md";

export default function MelodyBar(props) {
    const { melodies } = props;
    let melodyArray = melodies.split("\n");

    return (
        <div>
            <label style={{ padding: "0 0 0 10px", marginBottom:"0px" }}>Melodies</label>
            <ul style={{ listStyle: "none", padding: "0px 0px 0px 8px", marginBottom:"5px" }}>
                {melodyArray.map((melody) => (
                    <li>
                        <MdMusicNote style={{position:"relative", bottom:"1px"}}></MdMusicNote>
                        {melody}
                    </li>
                ))}
            </ul>
        </div>
    );
}
