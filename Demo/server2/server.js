const express = require('express')
const app = express()
const port = 3000

const userRouter = require("./routes/user")
const authorize = require("./middlewares/auth")

// Parse JSON
app.use(express.json())

// JWT + User routes
app.use("/users", (req, res, next) => {
    // Allow public APIs
    if (req.url === "/signin" || req.url === "/signup") {
        next()
    } 
    // Protect all other APIs
    else {
        authorize(req, res, next)
    }
}, userRouter)

// Start server
app.listen(port, () => {
    console.log(`Server started at port ${port}`)
})
