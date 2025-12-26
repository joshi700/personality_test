const express = require('express');
const cors = require('cors');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const path = require('path');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.static('.'));

// In-memory database (replace with PostgreSQL in production)
const users = [
  { id: 1, username: 'admin', password: '$2b$10$YourHashedPasswordHere', role: 'admin' },
  { id: 2, username: 'user1', password: '$2b$10$YourHashedPasswordHere', role: 'user' }
];

// Routes
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.post('/api/login', async (req, res) => {
  const { username, password } = req.body;
  
  // Simple authentication (use bcrypt.compare in production)
  const user = users.find(u => u.username === username);
  
  if (!user) {
    return res.status(401).json({ error: 'Invalid credentials' });
  }
  
  const token = jwt.sign(
    { id: user.id, username: user.username, role: user.role },
    process.env.JWT_SECRET || 'secret',
    { expiresIn: '24h' }
  );
  
  res.json({ token, user: { id: user.id, username: user.username, role: user.role } });
});

app.post('/api/test/submit', (req, res) => {
  const { answers, userId } = req.body;
  // Process test submission
  res.json({ success: true, resultId: Date.now() });
});

app.get('/api/admin/stats', (req, res) => {
  res.json({
    totalOrganizations: 5,
    totalUsers: 150,
    totalTests: 45,
    activeTests: 12
  });
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
