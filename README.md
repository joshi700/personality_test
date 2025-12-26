# Personality Test Platform - Complete Package

A fully responsive, mobile-first personality assessment platform with comprehensive admin features.

## Features

✅ **Complete Mobile Responsive Design**
- Optimized for all screen sizes (mobile, tablet, desktop)
- Touch-friendly interface for mobile devices
- Responsive navigation with hamburger menu
- Mobile-optimized quiz interface

✅ **60 Questions Assessment**
- Likert scale (1-7) format
- Auto-save functionality
- Resume capability
- Progress tracking

✅ **Admin Panel**
- Organization management (up to 500 users)
- Question bank management
- Custom interpretations
- User credential generation
- Test builder with templates

✅ **Scoring System**
- Based on your matrix: 1,1,1,2 | 1,2,2,0 | 1,1,2,1 | 2,1,0,2
- Automatic score calculation
- Personality type determination
- Detailed results with interpretations

## Quick Start

### Option 1: Static HTML (Simplest)

1. Open `index.html` directly in a web browser
2. Login with default credentials:
   - Admin: `admin` / `admin123`
   - User: `user1` / `test123`

### Option 2: With Node.js Server

1. Install dependencies:
```bash
npm install
```

2. Create `.env` file:
```
PORT=3000
JWT_SECRET=your-secret-key
DATABASE_URL=postgresql://localhost:5432/personality_test
```

3. Run the server:
```bash
npm start
```

4. Open http://localhost:3000

### Option 3: Deploy to Vercel

1. Install Vercel CLI:
```bash
npm install -g vercel
```

2. Deploy:
```bash
vercel
```

## Database Setup (Optional)

If using PostgreSQL:

```bash
psql -U your_username -d your_database < database.sql
```

## Default Credentials

- **Admin**: admin / admin123
- **User 1**: user1 / test123
- **User 2**: user2 / test123

## Mobile Features

- **Responsive Layout**: Automatically adjusts to screen size
- **Touch Gestures**: Swipe-friendly interface
- **Mobile Navigation**: Hamburger menu for small screens
- **Optimized Forms**: Large touch targets for easy input
- **Readable Text**: Proper sizing for mobile devices

## Browser Support

- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+
- Mobile browsers (iOS Safari, Chrome Mobile)

## Customization

### Adding Questions
1. Login as admin
2. Go to Admin Panel > Questions
3. Click "Add Question"
4. Enter question details

### Modifying Scoring Matrix
Edit the scoring matrix in the admin panel under Interpretations

### Changing Colors
Modify CSS variables in the `:root` section of index.html

## File Structure

```
personality-quiz-complete/
├── index.html          # Complete application (all-in-one)
├── server.js           # Optional Node.js backend
├── database.sql        # Database schema
├── package.json        # Dependencies
├── .env.example        # Environment variables template
└── README.md          # This file
```

## Support

For issues or questions, please refer to the documentation or contact support.

## License

MIT License - Feel free to modify and use for your needs.
