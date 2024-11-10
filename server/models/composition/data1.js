const exercises = {
    upperBodyCore: [
        {
            name: "Seated Overhead Press with Core Engagement",
            subName: "Engages shoulders, arms, and core.",
            desc: "Press weights overhead while engaging core.",
            mode: "Medium",
            disabilityType: "Shoulder and core mobility",
            bodyParts:["Shoulders", "Core", "Arms"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Seated Dumbbell Punches",
            subName: "Works shoulders, arms, and core.",
            desc: "Punch forward alternately while keeping core engaged.",
            mode: "Medium",
            disabilityType: "Arm, shoulder limitations",
            bodyParts: ["Shoulders", "Core", "Arms"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Resisted Woodchops (With Bands)",
            subName: "Strengthens arms, shoulders, and core.",
            desc: "Pull resistance band diagonally across body from high to low.",
            mode: "Medium",
            disabilityType: "Shoulder and core limitations",
            bodyParts:["Shoulders", "Core", "Arms"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Medicine Ball Rotations (Seated)",
            subName: "Activates core and shoulders.",
            desc: "Hold a medicine ball and rotate side to side.",
            mode: "Medium",
            disabilityType: "Core and shoulder strength",
            bodyParts:["Shoulders", "Core"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Seated Side Reaches (With Band or Weight)",
            subName: "Targets core and shoulder flexibility.",
            desc: "Lean side to side while extending overhead.",
            mode: "Easy",
            disabilityType: "Core and shoulder flexibility",
            bodyParts: ["Shoulders", "Core"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Diagonal Arm Presses (Seated)",
            subName: "Engages shoulders, arms, and core.",
            desc: "Press arms diagonally across body, engaging core.",
            mode: "Medium",
            disabilityType: "Core and shoulder strength",
            bodyParts: ["Shoulders", "Core", "Arms"],
            image: "assets/placeHolder.jpg"
        }
    ],
    upperBodyBack: [
        {
            name: "Seated Resistance Band Rows",
            subName: "Engages back and arms.",
            desc: "Pull resistance band towards chest, engaging back muscles.",
            mode: "Medium",
            disabilityType: "Upper back and arm limitation",
            bodyParts: ["Back", "Arms"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Chest Press with Resistance Band (Seated)",
            subName: "Targets chest and arms.",
            desc: "Press arms forward against resistance band, working chest and shoulders.",
            mode: "Medium",
            disabilityType: "Upper body strength",
            bodyParts: ["Chest", "Arms"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Reverse Fly (Seated or Supported)",
            subName: "Works back and shoulders.",
            desc: "Pull arms back while holding weights.",
            mode: "Medium",
            disabilityType: "Back and shoulder strength",
            bodyParts: ["Back", "Shoulder"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Bent-Over Band Pulls (Seated)",
            subName: "Strengthens upper back and shoulders.",
            desc: "Pull resistance band upwards, bending slightly forward.",
            mode: "Medium",
            disabilityType: "Upper back mobility limitation",
            bodyParts:["Upper Back", "Shoulder"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Modified Chest Fly (Seated)",
            subName: "Activates chest and shoulder muscles.",
            desc: "Open arms out to the sides, bringing them back together slowly.",
            mode: "Medium",
            disabilityType: "Chest and shoulder limitations",
            bodyParts:  ["chest", "Shoulder"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Scapular Row (Seated with Band)",
            subName: "Engages upper back and arms.",
            desc: "Pull band with elbows back, squeezing shoulder blades.",
            mode: "Easy",
            disabilityType: "Arm and upper back strength",
            bodyParts:["Upper Back", "Arms"],
            image: "assets/placeHolder.jpg"
        }
    ],
    coreLowerBody: [
        {
            name: "Supported Leg Lifts",
            subName: "Strengthens core and lower body.",
            desc: "Lift legs up while leaning back slightly.",
            mode: "Medium",
            disabilityType: "Core and leg strength limitation",
            bodyParts: ["Core", "Lower Body"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Seated Marching",
            subName: "Activates hip flexors and core.",
            desc: "Alternately lift knees towards chest while seated.",
            mode: "Easy",
            disabilityType: "Hip flexors and core limitation",
            bodyParts: ["Core", "Hip Flexors"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Modified Bicycle Crunches (With Support)",
            subName: "Engages abs and hip flexors.",
            desc: "Simulate cycling motion while engaging core.",
            mode: "Medium",
            disabilityType: "Core strength",
            bodyParts: "Abs, Hip Flexors",
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Seated Side Knee Raises",
            subName: "Strengthens hip abductors and core.",
            desc: "Lift knees to the side while seated.",
            mode: "Medium",
            disabilityType: "Core and hip strength",
            bodyParts: "Core, Hips",
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Heel Taps (Seated or Reclined)",
            subName: "Engages lower abs and thighs.",
            desc: "Tap heels on the ground, engaging abs and thighs.",
            mode: "Easy",
            disabilityType: "Lower abs and thigh strength",
            bodyParts: ["Lower Abs", " Thighs"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Leg Crossovers (Seated)",
            subName: "Targets inner thighs and core.",
            desc: "Cross one leg over the other, alternating.",
            mode: "Medium",
            disabilityType: "Inner thigh and core limitation",
            bodyParts: ["Inner Thighs", " Core"],
            image: "assets/placeHolder.jpg"
        }
    ],
    fullBodySeated: [
        {
            name: "Seated Battle Rope Workout (If Available)",
            subName: "Engages arms, core, and shoulders.",
            desc: "Use battle ropes in short, controlled motions.",
            mode: "Hard",
            disabilityType: "Upper body, core limitations",
            bodyParts:[ "Arms", "Core", "Shoulders"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Medicine Ball Slams (With Limited Range)",
            subName: "Works arms, shoulders, and core.",
            desc: "Hold a medicine ball, lifting it overhead, then bring it down in a controlled slam motion.",
            mode: "Medium",
            disabilityType: "Upper body and core limitation",
            bodyParts:[ "Arms", "Core", "Shoulders"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Seated Boxing (With Light Weights)",
            subName: "Activates arms, shoulders, and core.",
            desc: "Perform punches with light weights for core stability.",
            mode: "Medium",
            disabilityType: "Arm and core strength limitation",
            bodyParts:[ "Arms", "Core", "Shoulders"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Dynamic Arm Crosses (With Light Weights)",
            subName: "Engages shoulders, arms, and chest.",
            desc: "Cross arms in front while holding light weights.",
            mode: "Easy",
            disabilityType: "Shoulder mobility limitations",
            bodyParts: [ "Arms", "Chest", "Shoulders"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Resistance Band Uppercuts (Seated)",
            subName: "Works shoulders, core, and arms.",
            desc: "Use resistance bands to perform uppercut motions.",
            mode: "Medium",
            disabilityType: "Arm and shoulder strength",
            bodyParts: [ "Arms", "Core", "Shoulders"],
            image: "assets/placeHolder.jpg"
        },
        {
            name: "Seated High-Knee Raises with Arm Swings",
            subName: "Activates arms, core, and leg muscles for a full-body seated workout.",
            desc: "Raise knees towards chest while swinging arms.",
            mode: "Medium",
            disabilityType: "Lower body and arm strength",
            bodyParts: [ "Arms", "Core", "Legs"],
            image: "assets/placeHolder.jpg"
        }
    ]
};

module.exports = exercises;
