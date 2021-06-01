import React, { Fragment } from "react";

export default function UpdateDisplay({ children }) {
    return (
        <Fragment>
            <div className="row">
                <div className="col-3">{children}</div>
                <div className="col-3">{children}</div>
            </div>
        </Fragment>
    );
}
