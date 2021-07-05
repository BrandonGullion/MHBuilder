import React from "react";
import emailjs from "emailjs-com";

export default function ContactPage() {
    function sendEmail(e) {
        e.preventDefault();

        emailjs
            .sendForm(
                "service_6w91vuq",
                "template_oxb0wud",
                e.target,
                "user_GC8AsMOq6VGet9L26ha7v"
            )
            .then(
                (result) => {
                    console.log(result.text);
                },
                (error) => {
                    console.log(error.text);
                }
            );
    }

    return (
        <div style={{ margin: "10px 0 0 10px" }}>
            <div style={{ display: "flex" }}>
                <label
                    style={{
                        fontSize: "30px",
                        margin: "0px auto 0px auto",
                        color: "#ccc",
                    }}
                >
                    Contact Us!
                </label>
            </div>

            {/* container for the left to right flex */}
            <div
                style={{
                    display: "flex",
                    margin: "30px 0 0 0px",
                    justifyContent: "center",
                }}
            >
                {/* Left side of the screen */}
                <form
                    onSubmit={sendEmail}
                    style={{
                        display: "flex",
                        flexDirection: "column",
                        position: "relative",
                        width: "400px",
                        marginTop: "50px",
                    }}
                >
                    <input
                        className="default-input"
                        placeholder="Name   (optional)"
                        name="name"
                    ></input>
                    <input
                        className="default-input"
                        placeholder="Email   (optional)"
                        name="email"
                    ></input>
                    <input
                        className="default-input"
                        placeholder="Subject"
                        name="subject"
                    ></input>
                    <textarea
                        style={{ height: "150px" }}
                        className="default-input"
                        placeholder="Enter bug/improvement ideas here..."
                        name="message"
                    ></textarea>
                    <div style={{ position: "relative" }}>
                        <button
                            type="submit"
                            className="index-button"
                            style={{
                                position: "absolute",
                                right: "0",
                                fontSize: "16px",
                                margin: "5px",
                                padding: "5px 10px",
                            }}
                        >
                            Submit
                        </button>
                    </div>
                </form>
                {/* Center line break */}
                <div
                    style={{
                        display: "flex",
                        flexDirection: "column",
                        height: "450px",
                        borderColor: "#ccc",
                        borderWidth: "0 0 0 1px",
                        borderStyle: "solid",
                        margin: "10px 70px",
                    }}
                ></div>

                {/* Right side of the screen */}
                <div
                    style={{
                        display: "flex",
                        flexDirection: "column",
                        color: "#ccc",
                        marginTop: "100px",
                    }}
                >
                    <h3>Found a bug or have ideas for improvement?</h3>
                    <p style={{ width: "400px", marginTop: "20px" }}>
                        Feel free to send an email! We would love to hear from
                        you!
                    </p>
                    <p style={{ width: "400px", marginTop: "20px" }}>
                        If you're informing us of a bug, please let us know as
                        many details as you can! The more information such as
                        the browser you were using can really help narrow the
                        problem!
                    </p>
                </div>
            </div>
        </div>
    );
}
