//creatiing collection
db.createCollection("user");
db.createCollection("supplier");
db.createCollection("employee");
db.createCollection("admin");
db.createCollection("category");
db.createCollection("item");
db.createCollection("order");

db.user.insertOne({
  _id: 1,
  name: "Henny",
  password: "askME!!",
  email: "askme@nothing.com",
  gender: "male",
  phone_number: "+1 426-388-9999",
  address: "N0 9 Peace street Ontario",
  created_at: Date(),
});

db.supplier.insertOne({
  _id: 1,
  name: "Kante",
  email: "PimpKante@nothing.com",
  information: "Supplies Jordan hoodies",
  gender: "female",
  phone_number: "+1 647 555 0179",
  date_supplied: Date(),
  user_id: 2,
});

db.employee.insertOne({
  _id: 1,
  name: "Biti",
  email: "Biti@askme.com",
  information: "sales representative",
  department: "Pharmercy",
  phone_number: "+1 624 786 6786",
  gender: "male",
  user_id: 3,
});

db.admin.insertOne({
    _id: 1, name:'Mohbad', role:'Light', user_id: 4
})

db.category.insertOne({
    _id: 1, name:'wool', 
})

db.item.insertOne({
    _id: 1, description:'Long Sleeve', size:'small', price:'$50', Qty_in_stock:'7', category:'wool', supplier:1, created_at: Date()
})

db.order.insertOne({
    _id: 1, quantity: 3, total_cost:'$150', status: 'paid', item:1, user_id: 1, created_at: Date()
})

db.category.update(
    {_id: 1,},
    {$set: { name: cotton}}
)

db.admin.update(
    {_id: 1},
    {$set: { name: 'IMOLE', role:'Never Forgotten'} }
)

// query data
db.admin.find({_id: 1})

db.item.findOne({ _id: 1})

// get all orders based on user id
db.order.aggregate([
    { $lookup: { from: 'user', localField:'user_id', foreignField:'_id', as:'user'}}
])