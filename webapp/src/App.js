import "./App.css";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Index from "./Pages/Index";
import Navbar from "./Components/Navbar";
import { Fragment } from "react";
import BuilderPage from "./Pages/BuilderPage";
import Header from "./Components/Header";
import UpdateDisplay from "./Components/Index/UpdateDisplay";
import UpdateItem from "./Components/Index/UpdateItem";
import Update from "./Models/Update";
import DeveloperPage from "./Pages/DeveloperPage";

function App() {
    let date = new Date().toLocaleDateString();
    let updateArray = [new Update(1, "Test Title", "Test Content", date)];

    return (
        <Fragment>
            <Router>
                <Header></Header>
                <Navbar></Navbar>
                <Switch>
                    <Route exact path="/">
                        <Index>
                            <UpdateDisplay>
                                {updateArray.map((update) => (
                                    <UpdateItem
                                        key={update.id}
                                        updateTitle={update.updateTitle}
                                        updateContent={update.updateContent}
                                        date={date}
                                    ></UpdateItem>
                                ))}
                            </UpdateDisplay>
                        </Index>
                    </Route>
                    <Route path="/builder">
                        <BuilderPage></BuilderPage>
                    </Route>
                    <Route path="/dev">
                        <DeveloperPage></DeveloperPage>
                    </Route>
                </Switch>
            </Router>
        </Fragment>
    );
}

export default App;
