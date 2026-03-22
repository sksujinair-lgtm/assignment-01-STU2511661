// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    product_id: "E1001",
    name: "Samsung Smart TV",
    category: "Electronics",
    brand: "Samsung",
    price: 55000,
    specifications: {
      screen_size: "55 inches",
      resolution: "4K UHD",
      voltage: "220V",
      warranty: "2 years"
    },
    features: ["Smart TV", "WiFi Enabled", "HDR"],
    stock: 25
  },
  {
    product_id: "C2001",
    name: "Men's Casual Shirt",
    category: "Clothing",
    brand: "Levis",
    price: 1999,
    sizes_available: ["S", "M", "L", "XL"],
    material: "Cotton",
    color: "Blue",
    stock: 50
  },
  {
    product_id: "G3001",
    name: "Organic Milk",
    category: "Groceries",
    brand: "Amul",
    price: 60,
    quantity: "1 litre",
    expiry_date: new Date("2024-12-31"),
    stock: 100
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { product_id: "E1001" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });

// Explanation:
// Creating an index on the "category" field improves query performance,
// especially for frequent searches like filtering products by category
// (e.g., Electronics or Groceries). It reduces scan time and speeds up retrieval.
