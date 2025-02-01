from flask import Flask, jsonify
import random
import uuid
from datetime import datetime, timedelta

app = Flask(__name__)

# Function to generate random dates
def random_date(start, end):
    return start + timedelta(days=random.randint(0, (end - start).days))

# Define mock sales data
def generate_fake_sales(n=1000):
    sales = []
    for _ in range(n):
        sale = {
            "order_id": str(uuid.uuid4()),
            "product_id": str(uuid.uuid4()),
            "product_title": f"Book {random.randint(1, 5000)}",
            "author": f"Author {random.randint(1, 100)}",
            "genre": random.choice(["Fiction", "Sci-Fi", "Fantasy", "Mystery", "Horror"]),
            "publisher": random.choice(["Penguin", "HarperCollins", "Simon & Schuster"]),
            "price": round(random.uniform(10, 150), 2),
            "quantity": random.randint(1, 5),
            "total_price": round(random.uniform(10, 300), 2),
            "sale_date": random_date(datetime(2023, 1, 1), datetime(2025, 1, 1)).strftime("%Y-%m-%d"),
            "marketplace": random.choice(["Amazon US", "Amazon UK", "Amazon JP", "Shopee", "Mercado Livre"]),
            "customer_id": str(uuid.uuid4()),
            "customer_location": random.choice(["US", "UK", "JP", "BR", "CA", "DE"]),
        }
        sales.append(sale)
    return sales

@app.route('/api/external-sales', methods=['GET'])
def get_sales():
    fake_sales = generate_fake_sales()
    return jsonify(fake_sales)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5001)
