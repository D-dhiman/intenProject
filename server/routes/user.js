const express = require("express");
const router = express.Router();
const wrapAsync = require("../utils/wrapAsync.js");
const User = require("../models/user.js")
const passport = require("passport");
const Data = require("../models/data.js");

router.route("/signup").post(wrapAsync(async (req, res, next) => {
    console.log("hello")
    try {
        console.log(req.body)
        let { username, email, password } = req.body;

        const newUser = new User({ email, username });
        console.log(newUser);
        
        // Register new user with the specified password
        const registeredUser = await User.register(newUser, password);
        console.log(registeredUser);

        // Save the user's ID in app-level locals
        req.app.locals.user = registeredUser._id;
        console.log(req.app.locals.user);

        return res.status(200).send({ message: 'User created successfully!' });

    } catch (error) {
        console.log(error.message);

        // Send a generic error response
        return res.status(500).send({ message: error.message });
    }
}));

router.route("/login").post((req, res, next) => {
    passport.authenticate("local", (err, user, info) => {
        if (err) {
            return res.status(500).json({ message: 'An error occurred during authentication.' });
        }
        if (!user) {
            // Respond with a message if authentication fails
            return res.status(401).json({ message: 'Invalid username or password.' });
        }
        req.logIn(user, (err) => {
            if (err) {
                return res.status(500).json({ message: 'Login failed.' });
            }
            console.log("logged in");
            return res.status(200).json({ message: 'Logged in successfully!' });
        });
    })(req, res, next);
});




module.exports = router;