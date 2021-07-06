import React, { useContext, useEffect, useState } from "react";
import { BuilderStateContext } from "../../../Contexts/BuilderContext";
import RadioButton from "../../ReUsable/RadioButton";
import EquipmentSet from "./EquipmentSet";

export default function ArmorTabContents() {
    // List of armors that will be iterated over
    const state = useContext(BuilderStateContext);
    const { armors } = state;

    const armorRanks = {
        highRank: "HighRank",
        lowRank: "LowRank",
    };
    // False will be for low rank and true for high rank
    const [armorRank, setArmorRank] = useState(armorRanks.lowRank);

    // Nested array that will hold sets of armor based on armorSetId Prop
    const [sortedHighRankArmors, setSortedHighRankArmors] = useState([]);
    const [sortedLowRankArmors, setSortedLowRankArmors] = useState([]);

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
                return sortedHighRankArmors.map((x) => (
                    <EquipmentSet
                        key={x.armorArray[0].armorSetId}
                        armorArray={x.armorArray}
                    ></EquipmentSet>
                ));
            case armorRanks.lowRank:
                return sortedLowRankArmors.map((x) => (
                    <EquipmentSet
                        key={x.armorArray[0].armorSetId}
                        armorArray={x.armorArray}
                    ></EquipmentSet>
                ));
            default:
                break;
        }
    };

    useEffect(() => {
        if (state.armors.length > 0 && state.armors !== undefined) {
            // Populate the sortedArmors array, creating new nested arrays if there is not an array present
            // ***armorSetId represents the array placement
            armors.forEach((armor) => {
                // Sets the low rank array
                if (armor.rank === "Low") {
                    // There is not another piece of armor with the id present in the array
                    if (
                        !sortedLowRankArmors.some(
                            (x) => x.id === armor.armorSetId
                        )
                    ) {
                        // Need to add a new object to the array
                        sortedLowRankArmors.push({
                            id: armor.armorSetId,
                            armorArray: [],
                        });
                    }

                    let index = sortedLowRankArmors.findIndex(
                        (x) => x.id === armor.armorSetId
                    );
                    sortedLowRankArmors[index].armorArray.push(armor);
                }
                // Sets the high rank array
                else if (armor.rank === "High") {
                    if (
                        !sortedHighRankArmors.some(
                            (x) => x.id === armor.armorSetId
                        )
                    ) {
                        // Need to add a new object to the array
                        sortedHighRankArmors.push({
                            id: armor.armorSetId,
                            armorArray: [],
                        });
                    }

                    let index = sortedHighRankArmors.findIndex(
                        (x) => x.id === armor.armorSetId
                    );
                    sortedHighRankArmors[index].armorArray.push(armor);
                }
            });

            // Sort them by armor set id aka. object id 
            setSortedHighRankArmors(
                sortedHighRankArmors.sort((a, b) => (a.id > b.id ? 1 : -1))
            );
            setSortedLowRankArmors(
                sortedLowRankArmors.sort((a, b) => (a.id > b.id ? 1 : -1))
            );
        }
    }, [state.armors]);

    return (
        <div
            style={{
                overflowY: "scroll",
                maxHeight: "669px",
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
