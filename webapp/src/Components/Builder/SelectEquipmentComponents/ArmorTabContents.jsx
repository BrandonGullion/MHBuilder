import React, {useState} from "react";
import RadioButton from "../../ReUsable/RadioButton";
import EquipmentSet from "./EquipmentSet";

export default function ArmorTabContents(props) {
    // List of armors that will be iterated over
    const { dispatch, armors } = props;

    const armorRanks = {
        highRank: "HighRank",
        lowRank: "LowRank",
    };
    // False will be for low rank and true for high rank
    const [armorRank, setArmorRank] = useState(armorRanks.lowRank);

    // Nested array that will hold sets of armor based on armorSetId Prop
    const sortedHighRankArmors = [];
    const sortedLowRankArmors = [];

    // using this in case there is a master or G rank introduced and bool
    // will not be enough
    const setDesiredArmorRank = (desiredRank) => {
        switch (desiredRank) {
            case armorRanks.highRank:
                setArmorRank(armorRanks.highRank);
                break;
            case armorRanks.lowRank:
                setArmorRank(armorRanks.lowRank);
                break;
            default:
                break;
        }
    };

    const renderArmors = () => {
        switch (armorRank) {
            case armorRanks.highRank:
                return sortedHighRankArmors.map((armorArray) => (
                    <EquipmentSet
                        key={armorArray[0].armorSetId}
                        armorArray={armorArray}
                        dispatch={dispatch}
                    ></EquipmentSet>
                ));
            case armorRanks.lowRank:
                return sortedLowRankArmors.map((armorArray) => (
                    <EquipmentSet
                        key={armorArray[0].armorSetId}
                        armorArray={armorArray}
                        dispatch={dispatch}
                    ></EquipmentSet>
                ));
            default:
                break;
        }
    };

    // Populate the sortedArmors array, creating new nested arrays if there is not an array present
    // ***armorSetId represents the array placement
    armors.forEach((armor) => {
        // Sets the low rank array
        if (armor.rank === "Low") {
            if (sortedLowRankArmors.length < armor.armorSetId) {
                sortedLowRankArmors.push([]);
            }
            sortedLowRankArmors[armor.armorSetId - 1].push(armor);
        }
        // Sets the high rank array
        else if (armor.rank === "High") {
            if (sortedHighRankArmors.length < armor.armorSetId) {
                sortedHighRankArmors.push([]);
            }
            sortedHighRankArmors[armor.armorSetId - 1].push(armor);
        }
    });

    return (
        <div
            style={{
                overflowY: "scroll",
                maxHeight: "700px",
                paddingRight: "10px",
            }}
        >
            {/* Rank Selection buttons */}
            <div className="flex-container justify-space-around">
                <div
                    className="armor-rank-button"
                    onClick={() => setDesiredArmorRank(armorRanks.lowRank)}
                >
                    {armorRank === armorRanks.lowRank ? (
                        <RadioButton active={true} content="Low Rank" />
                    ) : (
                        <RadioButton content="Low Rank" active={false} />
                    )}
                </div>
                <div
                    className="armor-rank-button"
                    onClick={() => setDesiredArmorRank(armorRanks.highRank)}
                >
                    {armorRank === armorRanks.highRank ? (
                        <RadioButton active={true} content="High Rank" />
                    ) : (
                        <RadioButton content="High Rank" active={false} />
                    )}
                </div>
            </div>
            {/* Renders equipment set, passing in the nested array */}
            {renderArmors()}
        </div>
    );
}
