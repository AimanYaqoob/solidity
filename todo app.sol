// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

// contract ToDo
// {
//  struct Todo{
//     string task;
//        bool isDone;
//    } 
//    mapping (address => Todo[]) public todos;

//    function addTask(string memory _task) public {
//       todos[msg.sender].push(Todo({
//           task:_task,
//           isDone:false
//       }));
//    } 

//     function getTask(uint _taskIndex) public view returns (Todo memory){
//        Todo memory task = todos[msg.sender][_taskIndex];
//        return task;
//    }

//    function deleteTask(uint _taskIndex) public {
//        delete todos[msg.sender][_taskIndex];
//    } 

//    function updateStatus(uint _taskIndex,bool _status) public {
//         todos[msg.sender][_taskIndex].isDone = _status;
//    } 

//    function getTaskCount() public view returns (uint){
//         return todos[msg.sender].length;
//     } 

// }  

contract Todo{

    struct TodoModel{
        uint index;
        string todoName;
        string todoDes;
    }

    struct MainTodoModel{
        TodoModel[] todoData;
    }


    mapping(address => MainTodoModel) todoMap;

    function adddTodos(uint _id, string memory _todoText, string memory _todoDes) public {
        TodoModel memory todoModel = TodoModel(_id, _todoText,_todoDes);
        todoMap[msg.sender].todoData.push(todoModel);
    }

    function getTodosData() public view returns(MainTodoModel memory){
        return todoMap[msg.sender];
    }

}
