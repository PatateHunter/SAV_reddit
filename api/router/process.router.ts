import express from "express";

const processRouter = express.Router();


/**
 * /toDoList/addItemByToDoListId/:id
 */
processRouter.post("/addItemByToDoListId/:id", async function (req, res) {
  //  const connection = await DatabaseUtils.getConnection();
    //const toDoListService = new ToDoListServiceImpl(connection);

    const name = req.body.name;
    const content = req.body.content;
    const todolist = parseInt(req.params.id);

    if (name === undefined || content === undefined || todolist === undefined) {
        res.status(400).end("Veuillez renseigner les informations nécessaires");
        return;
    }

   /* const success = await toDoListService.add({
        id: 0,
        name: name,
        content: content,
        dateHourAdd: new Date(),
        toDoList: todolist
    });
    console.log(success)

    if (!success) {
        res.status(500).end("La création n'a pas pu aboutir, veillez à renseigner des informations valides");
    } else {
        res.status(201).end();
    }*/
});

export {
    processRouter
}
