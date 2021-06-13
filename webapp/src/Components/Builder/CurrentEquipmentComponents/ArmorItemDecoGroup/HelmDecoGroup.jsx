import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function HelmDecoGroup(props) {

    const {currentHelm, setCurrentSkills, skills} = props; 

    return (
        <div>
            <ArmorItem armorPiece = {currentHelm} setCurrentSkills={setCurrentSkills}></ArmorItem>
            <DecorationItem armorPiece = {currentHelm} skills={skills} setCurrentSkills={setCurrentSkills} ></DecorationItem>
        </div>
    );
}
