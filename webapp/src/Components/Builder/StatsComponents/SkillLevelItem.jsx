import React from "react";
import { BsDiamond, BsDiamondFill } from "react-icons/bs";

export default function SkillLevelItem(props) {
    const { maxLevel, currentLevel } = props;

    let maxLevelIndicator = [];
    for (let i = 0; i < maxLevel; i++) {
        // If the current level is less than the max level, then create a filled diamond
        if (i < currentLevel) {
            // This may be a good idea... not too sure how it will work in the long run
            let leftOffset = i * 16 + 2;
            maxLevelIndicator.push(
                <BsDiamondFill
                    key={Math.random()}
                    style={{
                        fontSize: "12px",
                        position: "absolute",
                        top: "8px",
                        left: `${leftOffset}px`,
                    }}
                ></BsDiamondFill>
            );
        }
        maxLevelIndicator.push(<BsDiamond key={Math.random()} />);
    }

    return (
        <div
            className={
                currentLevel > maxLevel
                    ? "skill-level-indicator skill-level-indicator-over"
                    : "skill-level-indicator"
            }
        >
            {maxLevelIndicator}
        </div>
    );
}
