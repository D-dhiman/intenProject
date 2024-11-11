const express = require("express");
const router = express.Router();
const wrapAsync = require("../utils/wrapAsync.js");
const User = require("../models/user.js")
const passport = require("passport");

router.route("/signup").post(wrapAsync(async (req, res, next) => {
    console.log("hello")
    try {
        console.log(req.body)
        let { username, email, password } = req.body;

        const newUser = new User({ email, username });
        const registeredUser = await User.register(newUser, password);
        req.app.locals.user = registeredUser._id;

        return res.status(200).send({ message: 'User created successfully!' });

    } catch (error) {
        console.log(error.message);
        return res.status(500).send({ message: error.message });
    }
}));

router.route("/login").post((req, res, next) => {
    passport.authenticate("local", (err, user, info) => {
        if (err) {
            return res.status(500).json({ message: 'An error occurred during authentication.' });
        }
        if (!user) {
            return res.status(401).json({ message: 'Invalid username or password.' });
        }
        req.logIn(user, (err) => {
            if (err) {
                return res.status(500).json({ message: 'Login failed.' });
            }
            return res.status(200).json({ message: 'Logged in successfully!' });
        });
    })(req, res, next);
});




module.exports = router;