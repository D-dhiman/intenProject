const express = require("express");
const mongoose = require("mongoose");
const CompositionCategory = require("./models/composition/composition-model"); // Adjust path if necessary
const exerciseData = require("./models/composition/data1"); // Adjust path if necessary

const app = express();
const port = 5000;

// Connect to MongoDB
mongoose.connect('mongodb://127.0.0.1:27017/mobile', { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("Connected to DB"))
  .catch(err => console.log(err));

// Initialize DB with exercises
const initDb = async () => {
  await CompositionCategory.deleteMany({}); // Clean up old data
  await CompositionCategory.create(exerciseData); // Insert new data
  console.log("Database initialized");
};

initDb();

// Get exercises for a specific category (e.g., upperBodyCore)
app.get('/exercises/:category', async (req, res) => {
  const category = req.params.category;
  try {
    const exercises = await CompositionCategory.findOne({}, { [category]: 1 });
    res.json(exercises[category]);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Start server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});


