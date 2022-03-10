
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
