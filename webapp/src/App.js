import "./App.css";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Index from "./Pages/Index";
import Navbar from "./Components/Navbar";
import { Fragment } from "react";
import BuilderPage from "./Pages/BuilderPage";
import Header from "./Components/Header";
import DeveloperPage from "./Pages/DeveloperPage";
import { BuilderContext } from "./Contexts/BuilderContext";
import { HomePageContext } from "./Contexts/HomePage";
import LoginPage from "./Pages/LoginPage";
import DevContext from "./Contexts/DevContext";
import PrivateRoute from "./Components/PrivateRoute";
import ContactPage from "./Pages/ContactPage";

function App() {
    return (
        <Fragment>
            <Router>
                <Header></Header>
                <Navbar></Navbar>
                <Switch>
                    <Route exact path="/">
                        <HomePageContext>
                            <Index></Index>
                        </HomePageContext>
                    </Route>
                    <Route exact path="/contact">
                        <ContactPage></ContactPage>
                    </Route>
                    <Route exact path="/builder">
                        <BuilderContext>
                            <BuilderPage></BuilderPage>
                        </BuilderContext>
                    </Route>
                    <DevContext>
                        <PrivateRoute exact path="/dev">
                            <DeveloperPage></DeveloperPage>
                        </PrivateRoute>
                        <Route exact path="/login">
                            <LoginPage></LoginPage>
                        </Route>
                    </DevContext>
                </Switch>
            </Router>
        </Fragment>
    );
}

export default App;
