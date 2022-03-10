// const { MongoClient } = require('mongodb');
// main();
// async function main() {
//
//     const uri = "mongodb+srv://admin:admin@cluster0.sn8tt.mongodb.net/cluster0?retryWrites=true&w=majority";
//     const client = new MongoClient(uri);
//     try {
//         // Connect to the MongoDB cluster
//         await client.connect();
//
//         // Make the appropriate DB calls
//         await listDatabases(client);
//
//     } catch (e) {
//         console.error(e);
//     } finally {
//         // Close the connection to the MongoDB cluster
//         await client.close();
//     }
// }
//
// async function listDatabases(client : any){
//     let databasesList = await client.db().admin().listDatabases();
//     console.log("aa2");
//     console.log("Databases:");
//     databasesList.databases.forEach((db: { name: any; }) => console.log(` - ${db.name}`));
// };

import * as mongoDB from "mongodb";
import * as dotenv from "dotenv";
export class DatabaseUtils{

    private static connection : mongoDB.MongoClient;

    static async getConnection() : Promise<mongoDB.MongoClient>{
        dotenv.config();

        if (process.env.DB_CONN_STRING == null || process.env.MFIX_COLLECTION_NAME == null)
            return this.connection;
        const client: mongoDB.MongoClient = new mongoDB.MongoClient(process.env.DB_CONN_STRING);

        await client.connect();

        const db: mongoDB.Db = client.db(process.env.DB_NAME);

        const mflixCollection: mongoDB.Collection = db.collection(process.env.MFIX_COLLECTION_NAME);

        //collections.games = gamesCollection;
        DatabaseUtils.connection = client;
        console.log(`Successfully connected to database: ${db.databaseName} and collection: ${mflixCollection.collectionName}`);
        return DatabaseUtils.connection;
    }
}