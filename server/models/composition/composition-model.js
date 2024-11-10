const mongoose = require("mongoose");

const exerciseSchema = new mongoose.Schema({
  name: { type: String, required: true },
  subName: { type: String, required: true },
  desc: { type: String, required: true },
  mode: { type: String, required: true },
  disabilityType: { type: String, required: true },
  bodyParts: [{ type: String }],
  image: { type: String }
});

const CompositionCategorySchema = new mongoose.Schema({
  upperBodyCore: [exerciseSchema],
  upperBodyBack: [exerciseSchema],
  coreLowerBody: [exerciseSchema],
  fullBodySeated: [exerciseSchema],
});

const CompositionCategory = mongoose.model("CompositionCategory", CompositionCategorySchema);

module.exports = CompositionCategory;
