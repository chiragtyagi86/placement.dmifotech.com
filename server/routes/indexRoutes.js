const express = require("express");
const db = require("../config/db");
const router = express.Router();
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const authenticateToken = require("../middleware/authenticateToken");
const candidateRoutes = require("./candidateRoutes");
require('dotenv').config();

const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
 
router.get("/get-data", (req, res) => {

  db.query("SELECT * FROM employee", (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
});

//registration for job-seeker
router.post("/sign-up", (req, res) => {
    const { name, email, password } = req.body;
    if (!name || !email || !password) {
      return res.status(400).json({ error: "All fields are required" });
    }
    if (!emailRegex.test(email) ||!passwordRegex.test(password)) {
        return res.status(400).json({ error: "Invalid email or password" });
      }

    db.query(
      "SELECT * FROM candidate WHERE email = ?",
      [email],
      (err, results) => {
        if (err) {
          return res.status(500).json({ error: err.message });
        }
        if (results.length > 0) {
          return res.status(400).json({ error: "Email already exists" });
        }
  
        // Fetch latest cand_id
        db.query(
          "SELECT cand_id FROM candidate ORDER BY cand_id DESC LIMIT 1",
          (err, lastCand) => {
            if (err) {
              return res.status(500).json({ error: err.message });
            }
  
            let candNumber = 1; // Default if no employees exist
            if (lastCand.length > 0) {
              const lastId = lastCand[0].cand_id; // Example: EMP2025003
              const lastNum = parseInt(lastId.slice(7)); // Extract 003
              candNumber = lastNum + 1; // Increment to 004
            }
  
            const candId = `Cand${new Date().getFullYear()}${candNumber
              .toString()
              .padStart(3, "0")}`;
            const hashedPassword = bcrypt.hashSync(password, 10);
            const newUser = {
              cand_id: candId,
              name: name,
              email: email,
              password: hashedPassword,
            };
  
            db.query("INSERT INTO candidate SET ?", newUser, (err, result) => {
              if (err) {
                return res.status(500).json({ error: err.message });
              }
              res.json({ message: "Candidate registered successfully", cand_id: candId });
            });
          }
        );
      }
    );
  });
router.post("/sign-in", (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ error: "All fields are required" });
  }
  if (!emailRegex.test(email)) {
    return res.status(400).json({ error: "Invalid email format" });
  }
  if (!passwordRegex.test(password)) {
    return res.status(400).json({
      error:
        "Password must be at least 6 characters long and contain at least one uppercase letter, one lowercase letter, and one number",
    });
  }

  const sql = "SELECT * FROM candidate WHERE email = ?";
  db.query(sql, [email], (err, results) => {
    if (err) {
      console.error("Failed to select user:", err);
      return res.status(500).json({ error: "Internal server error" });
    }

    if (results.length === 0) {
      return res.status(401).json({ error: "Invalid credentials" });
    }


    const user = results[0]; // Correctly define user

    bcrypt.compare(password, user.password, (err, isMatch) => {
      if (err) {
        console.error("Failed to compare passwords:", err);
        return res.status(500).json({ error: "Internal server error" });
      }

      if (!isMatch) {
        return res.status(401).json({ error: "Invalid credentials" });
      }

      // Generate JWT token using the user object
      const token = jwt.sign(
        { id: user.cand_id, email: user.email, role: user.role },
        process.env.JWT_SECRET,
        { expiresIn: "1h" }
      );

      res.json({
        message: "Login successful",
        token,
      });
    });
  });
});
  router.get("/dashboard", authenticateToken, (req, res) => {
    const email = req.user.email;

    
    const sql = "SELECT * FROM candidate WHERE email = ?";
  
    db.query(sql, [email], (err, result) => {
      if (err) return res.status(500).json({ message: "Server error" });
      if (result.length === 0)
        return res.status(404).json({ message: "User not found" });
  
      // Send both the user details and the email
      res.json({
        userDetails: result[0],
        message: ` ${email}`,
      });
    });
  });

router.use('/candidate',candidateRoutes)
module.exports = router;
