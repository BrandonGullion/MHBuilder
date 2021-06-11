import React, { Fragment } from "react";

export default function Index({children}) {
    return (
        <Fragment>
            <div className="update-fix-container">
                {/* Center Glass card for updates  */}
                <div
                    className="glass-card glass-card-fill"
                    style={{ marginTop: "15px" }}
                >
                    <div className="glass-card-header">
                        <h2>Latest Updates</h2>
                    </div>
                    <div className="glass-card-content">{children}</div>
                </div>

                {/* Fixes log */}
                <div
                    className="glass-card glass-card-fill"
                    style={{ marginTop: "15px" }}
                >
                    <div className="glass-card-header">
                        <h2>Latest Fixes</h2>
                    </div>
                    <div className="glass-card-content">
                        {/* Insert the lastest fixes components */}
                    </div>
                </div>
            </div>
        </Fragment>
    );
}
