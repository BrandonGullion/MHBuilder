import React, { Fragment } from "react";

export default function Index({children}) {
    return (
        <Fragment>
            {/* Welcome Banner */}
            <div className="glass-card glass-card-banner">
                <div>
                    <h1 className="banner-welcome">Welcome</h1>
                    <h2 className="banner-subtext"> To MHBuilder</h2>
                </div>
                <img
                    className="banner-image"
                    src="/Assets/Images/MHBuilderBanner2.png"
                    alt="MHbuilderBanner"
                ></img>
            </div>

            <div className="update-fix-container">
                {/* Center Glass card for updates  */}
                <div className="glass-card glass-card-fill">
                    <div className="glass-card-header">
                        <h2>Latest Updates</h2>
                    </div>
                    <div className="glass-card-content">
                        {children}
                    </div>
                </div>

                {/* Fixes log */}
                <div className="glass-card glass-card-fill">
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
