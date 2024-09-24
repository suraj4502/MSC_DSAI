# MongoDB Commands

```javascript
// Switch to (or create) a new database
use db;

// Create a collection
db.createCollection("name");

// Show all databases
show dbs;

// Show all collections in the current database
show collections;

// Insert a single document
db.collection.insertOne({});

// Insert multiple documents
db.collection.insertMany([{}, {}]);

// Find all documents in a collection
db.collection.find();

// Find documents where age is greater than or equal to 30
db.collection.find({ age: { $gte: 30 } });

// Find documents in 'p1' collection where age is greater than or equal to 20
db.p1.find({ age: { $gte: 20 } });

// Find specific fields (name and city, excluding _id)
db.collection.find({}, { name: 1, city: 1, _id: 0 });

// Update one document in 'p1' collection where name is 'suraj'
db.p1.updateOne(
  { name: "suraj" },
  { $set: { age: 32 } }
);

// Update multiple documents where age is less than 30
db.p1.updateMany(
  { age: { $lt: 30 } },
  { $set: { city: "Updated City" } }
);

// Delete one document where name is 'Doe'
db.collection.deleteOne({ name: "Doe" });

// Delete multiple documents where city is 'Paris'
db.collection.deleteMany({ city: "Paris" });

// Group by city and sort by totalPeople in descending order
db.collection.aggregate([
  { $match: { age: { $gte: 30 } } },  // Match stage
  { $group: { _id: "$city", totalPeople: { $sum: 1 } } },  // Group by city
  { $sort: { totalPeople: -1 } }  // Sort by totalPeople (descending)
]);

// Sort documents by age in ascending order
db.p1.find().sort({ age: 1 });

// Sort documents by name in descending order
db.collection.find().sort({ name: -1 });

// Find documents where age is greater than or equal to 30
db.collection.find({ age: { $gte: 30 } });

// Find documents where age is less than 25
db.collection.find({ age: { $lt: 25 } });

// Find documents where age is greater than 30 OR city is New York
db.collection.find({ $or: [{ age: { $gt: 30 } }, { city: "New York" }] });

// Find documents where age is greater than 30 AND city is not New York
db.collection.find({ $and: [{ age: { $gt: 30 } }, { city: { $ne: "New York" } }] });

db.collection.aggregate([
  {
    $project: {
      originalValue: "$value",
      absoluteValue: { $abs: "$value" },
      flooredValue: { $floor: "$value" },
      ceiledValue: { $ceil: "$value" }
    }
  }
]);

db.collection.aggregate([
  {
    $project: {
      originalValue: "$value",
      logValue: { $log: ["$value", 10] },  // Logarithm base 10
      modValue: { $mod: ["$value", 5] },   // Modulus by 5
      dividedValue: { $divide: ["$value", 2] },  // Divide by 2
      multipliedValue: { $multiply: ["$value", 2] }  // Multiply by 2
    }
  }
]);

db.collection.aggregate([
  {
    $project: {
      originalValue: "$value",
      powerValue: { $pow: ["$value", 2] },  // Raise to power 2
      sqrtValue: { $sqrt: "$value" },       // Square root
      subtractedValue: { $subtract: ["$value", 5] }  // Subtract 5
    }
  }
]);

db.collection.aggregate([
  {
    $project: {
      originalValue: "$value",
      truncatedValue: { $trunc: "$value" },  // Truncate to integer
      roundedValue: { $round: ["$value", 2] },  // Round to 2 decimal places
      comparedValue: { $cmp: ["$value", 10] }  // Compare with 10
    }
  }
]);

db.collection.aggregate([
  {
    $project: {
      fullName: { $concat: ["$firstName", " ", "$lastName"] }
    }
  }
]);


db.collection.aggregate([
  {
    $project: {
      name: 1,
      numSkills: { $size: "$skills" }
    }
  }
]);

// Rename a field in all documents
db.collection.updateMany(
  {},
  { $rename: { "oldFieldName": "newFieldName" } }
);
