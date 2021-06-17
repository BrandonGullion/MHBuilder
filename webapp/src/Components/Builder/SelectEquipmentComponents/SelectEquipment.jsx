import React from "react";
import { TabComponent } from "@syncfusion/ej2-react-navigations";
import ArmorTabContents from "./ArmorTabContents";
import WeaponTabContent from "./WeaponTabContent";

export default function SelectEquipment(props) {
    // List of armors that will be iterated over
    const { armors, weapons } = props;

    return (
        <div className="glass-card select-container">
            <div className="glass-card-header flex-container">
                <h2 className="pad-left-10">Equipment</h2>
            </div>

            <div className="glass-card-content">
                <TabComponent style={{ marginTop: "10px" }}>
                    <div className="e-tab-header">
                        <div>Armors</div>
                        <div>Weapons</div>
                    </div>
                    <div className="e-content">
                        <div>
                            <ArmorTabContents
                                armors={armors}
                            ></ArmorTabContents>
                        </div>
                        {/* Weapon Components */}
                        <div style={{transition:"0.2s",width:"400px"}}>
                            <WeaponTabContent weapons={weapons}></WeaponTabContent>
                        </div>
                    </div>
                </TabComponent>
            </div>
        </div>
    );
}
