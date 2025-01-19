# Backend Setup Documentation

## Overview
The backend for this project uses Appwrite to manage and retrieve data. This setup includes a database with a collection named `Items`.

## Collection Structure
- **Database Name:** `Appwrite Project`
- **Collection Name:** `Items`
- **Fields:**
    1. `title` (String): The title of the item.
    2. `description` (String): A short description of the item.

## API Endpoints
The following Appwrite SDK function is used to fetch data:
##dart

final response = await _database.listDocuments(
databaseId: '678aed0f003805d4182e',
collectionId: '678aed900000e9ded8cf',
);

## Appwrite Configuration Screenshots

## Database 
![Appwrite project](docs/databases.png)

### Collection 
![Items](docs/collections.png)

### attributes
![title and description](docs/attributes.png)

### Sample Data
![3 sample items](docs/documents.png)
