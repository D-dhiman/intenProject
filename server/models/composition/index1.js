const mongoose = require("mongoose"); 
const exerciseData = require("./data1.js");
const CompositionCategory = require("./composition-model.js")


main()
.then(() => console.log("connected to db"))
.catch(err => console.log(err));

async function main() {
  await mongoose.connect('mongodb://127.0.0.1:27017/mobile'); 
}

const initDb = async () => {
    await CompositionCategory.deleteMany({});

    await CompositionCategory.insertMany(exerciseData);
    console.log("data initialised")

};
initDb();

