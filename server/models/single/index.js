const mongoose = require("mongoose");
const initData = require("./data.js");

const SingleCategory = require("./single-model.js")


main()
.then(() => console.log("connected to db"))
.catch(err => console.log(err));

async function main() {
  await mongoose.connect('mongodb://127.0.0.1:27017/mobile'); 
}

const initDb = async () => {
    await SingleCategory.deleteMany({});

    await SingleCategory.insertMany(initData);
    console.log("data initialised")

};
initDb();