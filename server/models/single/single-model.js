const mongoose = require('mongoose');

const exerciseSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  subName : {
    type: String,
    required: true
  },
  desc: {
    type: String,
    required: true
  },
  mode: {
    type: String,
    required: true
  },
  disabilityType: {
    type: String,
    required: true
  },
  bodyParts: {
    type: [String],
    required: true
  },
  image: {
    type: String,
    required: true
  }
});

const singleCategorySchema = new mongoose.Schema({
  upper: [exerciseSchema],
  lower: [exerciseSchema],
  core: [exerciseSchema],
  back: [exerciseSchema],
  shoulder: [exerciseSchema]
});

const SingleCategory = mongoose.model('SingleCategory', singleCategorySchema);

module.exports = SingleCategory

