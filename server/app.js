const express = require("express");
const app = express();
const mongoose = require("mongoose");
const path = require("path");
const session = require("express-session");
const passport = require("passport");
const LocalStrategy = require("passport-local");
const User = require("./models/user")
const cors = require('cors');
const CompositionCategory = require("./models/composition/composition-model"); // Adjust path if necessary
// const exerciseData = require("./models/composition/data1"); // Adjust path if necessary


const dataRouter = require("./routes/data")
const userRouter = require("./routes/user")


main()
.then(() => console.log("connected to db"))
.catch(err => console.log(err));

async function main() {
    await mongoose.connect('mongodb://127.0.0.1:27017/mobile', { useNewUrlParser: true, useUnifiedTopology: true });
}

// const initDb = async () => {
//     await CompositionCategory.deleteMany({}); // Clean up old data
//     await CompositionCategory.create(exerciseData); // Insert new data
//     console.log("Database initialized");
//   };
  
//   initDb();

app.use(cors());
app.use(express.json());

const sessionOption = {
    secret : "mysupersecretcode",
    resave : false,
    saveUninitialized : true,
    cookie : {
        expires : Date.now() + 7 * 24 * 60 * 60 * 1000,
        maxAge : 7 * 24 * 60 * 60 * 1000,
        httpOnly : true,
    }
};


app.use(session(sessionOption));

app.use(passport.initialize());
app.use(passport.session());
passport.use(new LocalStrategy(User.authenticate()));
passport.serializeUser(User.serializeUser());
passport.deserializeUser(User.deserializeUser());

app.get('/exercises/:category/one', async (req, res) => {
    const {category} = req.params;
    console.log(category);
    try {
        const exercises = await CompositionCategory.findOne({});
        console.log(exercises[category][0])
        res.json(exercises[category][0]);
      } catch (err) {
        res.status(500).json({ message: err.message });
      }
});

app.get('/exercises/:category/two', async (req, res) => {
    const {category} = req.params;
    console.log(category);
    try {
        const exercises = await CompositionCategory.findOne({});
        console.log(exercises[category][1])
        res.json(exercises[category][1]);
      } catch (err) {
        res.status(500).json({ message: err.message });
      }
});
app.get('/exercises/:category/three', async (req, res) => {
    const {category} = req.params;
    console.log(category);
    try {
        const exercises = await CompositionCategory.findOne({});
        console.log(exercises[category][2])
        res.json(exercises[category][2]);
      } catch (err) {
        res.status(500).json({ message: err.message });
      }
});
app.get('/exercises/:category/four', async (req, res) => {
    const {category} = req.params;
    console.log(category);
    try {
        const exercises = await CompositionCategory.findOne({});
        console.log(exercises[category][3])
        res.json(exercises[category][3]);
      } catch (err) {
        res.status(500).json({ message: err.message });
      }
});
app.get('/exercises/:category/five', async (req, res) => {
    const {category} = req.params;
    console.log(category);
    try {
        const exercises = await CompositionCategory.findOne({});
        console.log(exercises[category][4])
        res.json(exercises[category][4]);
      } catch (err) {
        res.status(500).json({ message: err.message });
      }
});

app.get('/exercises/:category/six', async (req, res) => {
    const {category} = req.params;
    console.log(category);
    try {
        const exercises = await CompositionCategory.findOne({});
        console.log(exercises[category][5])
        res.json(exercises[category][5]);
      } catch (err) {
        res.status(500).json({ message: err.message });
      }
});

app.use("/api", dataRouter);
app.use("/", userRouter);



app.listen(3000, () => {
    console.log("app is listening on port 3000");
}); 