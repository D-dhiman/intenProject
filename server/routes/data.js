const express = require("express");
const router = express.Router();
const wrapAsync = require("../utils/wrapAsync.js");
const Data = require("../models/data.js");

//one
router.route("/fitness-level").post((req, res) => {
    const {fitnessLevel} = req.body;
    req.app.locals.fitnessLevel = fitnessLevel;
    console.log(fitnessLevel);
    return res.status(200).send({message : "fitness-level recieved"});
});

//two
router.route("/fitness-goal").post((req, res) => {
    const {goal} = req.body;
    req.app.locals.goal = goal;
    console.log(goal);
    return res.status(200).send({message : "fitness-goal recieved"});
});
//three
router.route("/disability").post((req, res) => {
    const {disabillity} = req.body;
    req.app.locals.disabillity = disabillity;
    console.log(disabillity);
    return res.status(200).send({message : "disability recieved"});
});
//four
router.route("/assistive-device").post((req, res) => {
    const {assistiveDevice} = req.body;
    req.app.locals.assistiveDevice = assistiveDevice;
    console.log(assistiveDevice);
    return res.status(200).send({message : "assistive-device recieved"});
});
//five
router.route("/activity-enjoyed").post((req, res) => {
    const {activityEnjoy} = req.body;
    req.app.locals.activityEnjoy = activityEnjoy;
    console.log(activityEnjoy);
    return res.status(200).send({message : "activity-enjoyed recieved"});
});
//six
router.route("/time-dedication").post((req, res) => {
    const {time} = req.body;
    req.app.locals.time = time;
    console.log(time);
    return res.status(200).send({message : "time-dedication recieved"});
});
//seven
router.route("/restrictions").post((req, res) => {
    const {restrictions} = req.body;
    req.app.locals.restrictions = restrictions;
    console.log(restrictions);
    return res.status(200).send({message : "restrictions recieved"});
});
//eight
router.route("/motivational-messages").post((req, res) => {
    const {motivationalMessages} = req.body;
    req.app.locals.motivationalMessages = motivationalMessages;
    console.log(motivationalMessages);
    return res.status(200).send({message : "motivational-messages recieved"});
});
//nine
router.route("/community-challenges").post(wrapAsync(async (req, res) => {
    const {communityChallenge} = req.body;
    req.app.locals.communityChallenge = communityChallenge;
    console.log(communityChallenge);
    const data = new Data({
        fitnessLevel : req.app.locals.fitnessLevel,
        goal : req.app.locals.goal,
        disabillity : req.app.locals.disabillity,
        assistiveDevice : req.app.locals.assistiveDevice,
        activityEnjoy : req.app.locals.activityEnjoy,
        time : req.app.locals.time,
        restrictions : req.app.locals.restrictions,
        motivationalMessages : req.app.locals.motivationalMessages,
        communityChallenge : req.app.locals.communityChallenge
    });
    data.user = req.app.locals.user;
    await data.save().then(() => console.log("data saved"));
    return res.status(200).send({message : "community-challenges recieved"});
}));



module.exports = router;
