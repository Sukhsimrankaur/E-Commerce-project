# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a category first
laptops = Category.find_or_create_by!(name: "Laptops", description: "All types of laptops and notebooks")

# Create 10 real products under that category
Product.create!([
  { name: "MacBook Air M2", description: "Apple laptop with M2 chip", sku: "MACAIR-M2", price: 1499.99, stock_quantity: 10, category: laptops },
  { name: "Dell XPS 13", description: "Compact high-performance laptop", sku: "DELLXPS13", price: 1299.99, stock_quantity: 15, category: laptops },
  { name: "HP Envy 15", description: "Powerful multimedia laptop", sku: "HPENVY15", price: 1199.99, stock_quantity: 12, category: laptops },
  { name: "ASUS ROG Strix", description: "Gaming laptop with RTX GPU", sku: "ASUSROG", price: 1899.99, stock_quantity: 8, category: laptops },
  { name: "Lenovo ThinkPad X1", description: "Business-class ultrabook", sku: "LENX1", price: 1399.99, stock_quantity: 9, category: laptops },
  { name: "Razer Blade 15", description: "Gaming laptop with high refresh rate display", sku: "RAZERB15", price: 1999.99, stock_quantity: 6, category: laptops },
  { name: "Acer Aspire 5", description: "Budget-friendly everyday laptop", sku: "ACERASP5", price: 599.99, stock_quantity: 20, category: laptops },
  { name: "Surface Laptop 5", description: "Premium Windows ultrabook by Microsoft", sku: "SURF5", price: 1599.99, stock_quantity: 7, category: laptops },
  { name: "MSI GF63", description: "Affordable gaming laptop with GTX graphics", sku: "MSIGF63", price: 999.99, stock_quantity: 10, category: laptops },
  { name: "Samsung Galaxy Book3", description: "Ultra-thin productivity laptop", sku: "SAMBK3", price: 899.99, stock_quantity: 11, category: laptops }
])
