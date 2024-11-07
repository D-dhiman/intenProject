const mongoose = require("mongoose");
const Schema = mongoose.Schema;
// const passportLocalMongoose = require("passport-local-mongoose");

const dataSchema = new Schema({
    fitnessLevel : {
        type : String,
    },
    goal : {
        type : String,
    },
    disabillity : {
        type : String,
    },
    assistiveDevice : {
        type : String,
    },
    activityEnjoy : {
        type : String,
    },
    time : {
        type : String,
    },
    restrictions : {
        type : String,
    },
    motivationalMessages : {
        type : String,
    },
    communityChallenge : {
        type : String,
    },
    user : {
        type : Schema.Types.ObjectId,
        ref : "User",
    }
});


module.exports = mongoose.model("Data", dataSchema);