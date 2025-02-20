const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(bodyParser.json());

// Sample product data
const products = [
    { id: 1, name: 'Laptop', price: 999 },
    { id: 2, name: 'Smartphone', price: 699 },
    { id: 3, name: 'Headphones', price: 199 }
];

// GET: Fetch all products
app.get('/products', (req, res) => {
    res.json(products);
});

// GET: Search for a product by name
app.get('/search', (req, res) => {
    const query = req.query.q.toLowerCase();
    const results = products.filter(p => p.name.toLowerCase().includes(query));
    res.json(results);
});

// POST: Add item to cart
let cart = [];
app.post('/cart', (req, res) => {
    const { productId } = req.body;
    const product = products.find(p => p.id === productId);
    
    if (product) {
        cart.push(product);
        res.json({ message: 'Product added to cart', cart });
    } else {
        res.status(404).json({ message: 'Product not found' });
    }
});

//  GET: View cart items
app.get('/cart', (req, res) => {
    res.json(cart);
});

// DELETE: Remove item from cart
app.delete('/cart/:id', (req, res) => {
    const productId = parseInt(req.params.id);
    cart = cart.filter(item => item.id !== productId);
    res.json({ message: 'Product removed from cart', cart });
});

// Start server
app.listen(PORT, () => {
    console.log(`Backend running on port ${PORT}`);
});

