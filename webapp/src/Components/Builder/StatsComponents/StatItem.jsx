import React from "react";

export default function StatItem(props) {
    const { statName, value } = props;

    return (
        <div className="stat-item-container">
            <h4>{statName}</h4>
            <label>{value === undefined ? "" : value.toString()}</label>
        </div>
    );
}
