import * as mongoDB from "mongodb";
import * as dotenv from "dotenv";

export class DatabaseUtils {

    private static connection: mongoDB.MongoClient;

    static async getConnection(): Promise<mongoDB.MongoClient> {
        dotenv.config();
        if (process.env.DB_CONN_STRING == null)
            return this.connection;
        const client: mongoDB.MongoClient = new mongoDB.MongoClient(process.env.DB_CONN_STRING);
        await client.connect();
        DatabaseUtils.connection = client;
        return DatabaseUtils.connection;
    }
}
