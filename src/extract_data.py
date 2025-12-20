import requests
import pandas as pd
import json

# 1. Define the API URL (The Source)
API_URL = "https://fakestoreapi.com/products"

def fetch_products():
    """
    Fetches raw product data from the API and saves it to a CSV.
    """
    print("🚀 Starting Data Extraction...")
    
    # 2. Extract (Get the data)
    try:
        response = requests.get(API_URL)
        response.raise_for_status() # Check for errors
        data = response.json() # Convert to Python Dictionary
        print(f"✅ Successfully fetched {len(data)} products.")
        
    except Exception as e:
        print(f"❌ Error fetching data: {e}")
        return

    # 3. Transform (Light cleaning with Pandas)
    # We turn the JSON dictionary into a Table (DataFrame)
    df = pd.DataFrame(data)
    
    # 4. Load (Save to local file for now)
    # In the real world, this would go to Snowflake. For now, a CSV is fine.
    df.to_csv("raw_products.csv", index=False)
    print("💾 Data saved to 'raw_products.csv'")

# 5. Run the function
if __name__ == "__main__":
    fetch_products()