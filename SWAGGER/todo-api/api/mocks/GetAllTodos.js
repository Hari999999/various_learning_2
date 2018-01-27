module.exports = {
    GetAllTodos: GetAllTodos
}

function GetAllTodos(req, res, next) {
    res.json([
        {
            todo_id: 0,
            todo: "Get some milk",
            author: "Jim",
            datecreated: "2018-01-27T11:06:38.621Z",
            duedate: "2018-01-27T11:09:30.622Z",
            completed: true
        },
        {
            todo_id: 1,
            todo: "Get some cereal",
            author: "Austin",
            datecreated: "2018-01-26T10:16:35.621Z",
            duedate: "2018-01-28T11:11:00.622Z",
            completed: true
        }
    ])
}