const express = require('express');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 4000;

app.use(cors());
app.use(express.json());

app.get('/api/health', (req, res) => {
  res.json({
    ok: true,
    service: 'node-backend',
    time: new Date().toISOString(),
  });
});

app.get('/api/demo', (req, res) => {
  res.json({
    message: 'Hello from the Node.js API',
    topics: ['Linux', 'Nginx', 'Node.js', 'React'],
  });
});

app.listen(PORT, () => {
  console.log(`API listening on http://localhost:${PORT}`);
});
