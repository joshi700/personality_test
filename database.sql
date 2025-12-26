-- Personality Test Platform Database Schema
-- Compatible with PostgreSQL

-- Organizations
CREATE TABLE IF NOT EXISTS organizations (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  max_users INTEGER DEFAULT 500,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Users
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(100) UNIQUE NOT NULL,
  email VARCHAR(255),
  password_hash VARCHAR(255),
  role VARCHAR(50) DEFAULT 'user',
  organization_id INTEGER REFERENCES organizations(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Questions
CREATE TABLE IF NOT EXISTS questions (
  id SERIAL PRIMARY KEY,
  text TEXT NOT NULL,
  section VARCHAR(100),
  type VARCHAR(50) DEFAULT 'scale',
  order_number INTEGER DEFAULT 0
);

-- Tests
CREATE TABLE IF NOT EXISTS tests (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  organization_id INTEGER REFERENCES organizations(id),
  questions JSONB NOT NULL,
  time_limit INTEGER DEFAULT 60,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Results
CREATE TABLE IF NOT EXISTS quiz_results (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  test_id INTEGER REFERENCES tests(id),
  answers JSONB NOT NULL,
  scores JSONB,
  personality_type VARCHAR(100),
  completed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Interpretations
CREATE TABLE IF NOT EXISTS interpretations (
  id SERIAL PRIMARY KEY,
  type VARCHAR(100) NOT NULL,
  title VARCHAR(255),
  description TEXT,
  score_min INTEGER DEFAULT 0,
  score_max INTEGER DEFAULT 100,
  characteristics JSONB
);

-- Scoring Matrix
CREATE TABLE IF NOT EXISTS scoring_matrix (
  id SERIAL PRIMARY KEY,
  question_range VARCHAR(50),
  pattern VARCHAR(100),
  weight DECIMAL(3,2) DEFAULT 1.0
);

-- Insert sample data
INSERT INTO organizations (name) VALUES 
  ('Tech Corp'),
  ('Marketing Agency');

INSERT INTO users (username, email, password_hash, role) VALUES
  ('admin', 'admin@test.com', '$2b$10$YourHashedPassword', 'admin'),
  ('user1', 'user1@test.com', '$2b$10$YourHashedPassword', 'user');

-- Insert scoring matrix based on provided pattern
INSERT INTO scoring_matrix (question_range, pattern) VALUES
  ('1-5', '1,1,1,2'),
  ('6-10', '1,2,2,0'),
  ('11-15', '1,1,2,1'),
  ('16-20', '2,1,0,2');

-- Create indexes for performance
CREATE INDEX idx_users_org ON users(organization_id);
CREATE INDEX idx_results_user ON quiz_results(user_id);
CREATE INDEX idx_results_test ON quiz_results(test_id);
