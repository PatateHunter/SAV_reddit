import {Express} from "express";
import {processRouter} from "./process.router";



export function buildRoutes(app: Express) {
    app.use("/toDoList", processRouter);
}
