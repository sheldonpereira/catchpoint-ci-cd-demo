const express = require('express');
const cors = require('cors');

const app = express();
const PORT = 3000;

app.use(cors());

// Sample product data
const products = [
    { id: 1, name: 'Laptop', price: 999 },
    { id: 2, name: 'Smartphone', price: 699 },
    { id: 3, name: 'Headphones', price: 199 },
    { id: 4, name: 'Tablet', price: 799 }
];

// GET: Fetch all products
app.get('/products', (req, res) => {
    res.json(products);
});

// GET: Search for a product by name
app.get('/search', (req, res) => {
    const query = req.query.q?.toLowerCase() || "";
    const results = products.filter(p => p.name.toLowerCase().includes(query));
    res.json(results);
});

// GET: View cart items (Read-only, no modifications allowed)
let cart = [];
app.get('/cart', (req, res) => {
    res.json(cart);
});

// Start server
app.listen(PORT, () => {
    console.log(`Backend running on port ${PORT}`);
});

