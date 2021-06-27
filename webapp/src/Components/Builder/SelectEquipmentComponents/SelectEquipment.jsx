import React from "react";
import { TabComponent } from "@syncfusion/ej2-react-navigations";
import ArmorTabContents from "./ArmorTabContents";
import WeaponTabContent from "./WeaponTabContent";
import TalismanTabContent from "./TalismanTabContent";

export default function SelectEquipment(props) {
    // List of armors that will be iterated over
    const { armors, weapons } = props;

    return (
        <div style={{padding:"15px 0 0 0"}}>
            <div className="glass-card-header flex-container" style={{color:"#ccc"}}>
                <h2 className="pad-left-10">Equipment</h2>
            </div>

        <div className="glass-card glass-card-content">
                <TabComponent style={{ marginTop: "10px" }}>
                    <div className="e-tab-header">
                        <div>Armors</div>
                        <div>Weapons</div>
                        <div>Talisman</div>
                    </div>
                    <div className="e-content">
                        <div style={{ transition: "0.2s", width: "410px" }}>
                            <ArmorTabContents
                                armors={armors}
                            ></ArmorTabContents>
                        </div>
                        {/* Weapon Components */}
                        <div style={{ transition: "0.2s", width: "410px" }}>
                            <WeaponTabContent
                                weapons={weapons}
                            ></WeaponTabContent>
                        </div>
                        <div style={{ transition: "0.2s", width: "410px" }}>
                            <TalismanTabContent></TalismanTabContent>
                        </div>
                    </div>
                </TabComponent>
            </div>
        </div>
    );
}
