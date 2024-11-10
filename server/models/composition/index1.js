const mongoose = require("mongoose"); 
const exerciseData = require("./data1.js");
const CompositionCategory = require("./composition_model.js");

async function main() {
  await mongoose.connect('mongodb://127.0.0.1:27017/mobile', { useNewUrlParser: true, useUnifiedTopology: true });
  console.log("Connected to DB");

  await CompositionCategory.deleteMany({});
  await CompositionCategory.create(exerciseData);
  console.log("Database initialized with exercise data");
}

main().catch(err => console.log(err));
