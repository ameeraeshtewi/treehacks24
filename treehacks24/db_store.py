import chromadb
import pandas as pd

chroma_client = chromadb.PersistentClient()
collections_list = chroma_client.list_collections()
print(collections_list[0].name)
collection = None
if "shops" in collections_list[0].name:
    print("Collection exists")
    collection = chroma_client.get_collection("shops")
else:
    print("Creating new collection")
    collection = chroma_client.create_collection(name="shops")

    # Load the CSV files
    file_path_costco = './data/Costco-products.csv'
    data_costco = pd.read_csv(file_path_costco)
    costco_products = data_costco.iloc[:, 0].astype(str).tolist()

    file_path_wf = './data/WholeFoods-products.csv'
    data_wf = pd.read_csv(file_path_wf)
    wf_products = data_wf.iloc[:, 0].astype(str).tolist()

    # Add Costco products
    collection.add(
        documents=costco_products,
        metadatas=[{"source": "Costco"}]*len(costco_products),
        ids=[f"costcoId{i+1}" for i in range(len(costco_products))]
    )

    # Add Whole Foods products
    collection.add(
        documents=wf_products,
        metadatas=[{"source": "Whole Foods"}]*len(wf_products),
        ids=[f"wholeFoodsId{i+1}" for i in range(len(wf_products))]
    )

results = collection.query(
    query_texts=["Lamp"],
    n_results=3
    # where={"source": "Costco"}
)

print(results)
print()

threshold = 1.2
product_matches = []
stores = []
for i in range(3):
    if results['distances'][0][i] < threshold:
        product_matches.append(results['documents'][0][i])
        stores.append(results['metadatas'][0][i]['source'])

print(product_matches)
print(stores)