// import 'package:flutter/material.dart';

// void main() => runApp(const Comment());

// class Task {
//   int id;
//   String name;
//   String email;
//   String body;

//   Task(
//       {required this.id,
//       required this.name,
//       required this.email,
//       required this.body});
// }

// class Comment extends StatelessWidget {
//   const Comment({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Todo App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: TodoListScreen(),
//     );
//   }
// }

// class TodoListScreen extends StatefulWidget {
//   @override
//   _TodoListScreenState createState() => _TodoListScreenState();
// }

// class _TodoListScreenState extends State<TodoListScreen> {
//   List<Task> tasks = [];
//   TextEditingController searchController = TextEditingController();
//   TextEditingController idController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController bodyController = TextEditingController();

//   void addTask() {
//     setState(() {
//       final newTask = Task(
//         id: int.tryParse(idController.text) ?? 0,
//         name: nameController.text,
//         email: emailController.text,
//         body: bodyController.text,
//       );
//       tasks.insert(0, newTask);
//       idController.clear();
//       nameController.clear();
//       emailController.clear();
//       bodyController.clear();
//     });
//   }

//   void updateTask(int index, Task updatedTask) {
//     setState(() {
//       tasks[index] = updatedTask;
//     });
//   }

//   void deleteTask(int index) {
//     setState(() {
//       tasks.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Todo List'),
//         ),
//         body: Column(children: [
//           Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Column(
//               children: [
//                 TextField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       hintText: 'Search...',
//                       // Add a clear button to the search bar
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.clear),
//                         onPressed: () => searchController.clear(),
//                       ),
//                       // Add a search icon or button to the search bar
//                       prefixIcon: IconButton(
//                         icon: Icon(Icons.search),
//                         onPressed: () {
//                           // Perform the search here
//                         },
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                     )),
//                 TextField(
//                   controller: idController,
//                   decoration: InputDecoration(labelText: 'ID'),
//                 ),
//                 TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(labelText: 'Name'),
//                 ),
//                 TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(labelText: 'Email'),
//                 ),
//                 TextField(
//                   controller: bodyController,
//                   decoration: InputDecoration(labelText: 'Body'),
//                 ),
//                 ElevatedButton(
//                   onPressed: addTask,
//                   child: Text('Add'),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: tasks.length,
//               itemBuilder: (ctx, index) {
//                 return ListTile(
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Id: ${tasks[index].id}'),
//                       Text('Name: ${tasks[index].name}'),
//                       Text('Email: ${tasks[index].email}'),
//                       Text('Body: ${tasks[index].body}'),
//                     ],
//                   ),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () => deleteTask(index),
//                   ),
//                   onTap: () {
//                     print('click function');
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         TextEditingController editIdController =
//                             TextEditingController(
//                                 text: tasks[index].id.toString());
//                         TextEditingController editNameController =
//                             TextEditingController(text: tasks[index].name);
//                         TextEditingController editEmailController =
//                             TextEditingController(text: tasks[index].email);
//                         TextEditingController editBodyController =
//                             TextEditingController(text: tasks[index].body);
//                         return AlertDialog(
//                           title: Text('Edit Task'),
//                           content: Column(
//                             children: [
//                               TextField(
//                                 controller: editIdController,
//                                 decoration: InputDecoration(labelText: 'Id'),
//                               ),
//                               TextField(
//                                 controller: editNameController,
//                                 decoration: InputDecoration(labelText: 'Name'),
//                               ),
//                               TextField(
//                                 controller: editEmailController,
//                                 decoration: InputDecoration(labelText: 'Email'),
//                               ),
//                               TextField(
//                                 controller: editBodyController,
//                                 decoration: InputDecoration(labelText: 'Body'),
//                               ),
//                             ],
//                           ),
//                           actions: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 final updatedTask = Task(
//                                   id: tasks[index].id,
//                                   // id: int.tryParse(idController.text) ?? 0,
//                                   name: editNameController.text,
//                                   email: editEmailController.text,
//                                   body: editBodyController.text,
//                                 );
//                                 updateTask(index, updatedTask);
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('Save'),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ]));
//   }
// }
import 'package:flutter/material.dart';
import '../model/data.dart';

class ShowCategory extends StatelessWidget {
  ShowCategory({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  final String name;
  final IconData icon;

  void deleteCategory(int index) {
    // Make sure you have access to the 'categories' list and modify it accordingly
    categories.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.purple),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Icon(
                              categories[index]
                                  .icon, // Use categories[index].icon
                              size: 30,
                              color: Color.fromRGBO(112, 20, 204, 1),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              categories[index]
                                  .name, // Use categories[index].name
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Delete ?'),
                                actions: [
                                  MaterialButton(
                                    child: const Text('No'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  MaterialButton(
                                    child: const Text('Yes'),
                                    onPressed: () {
                                      // Call the deleteCategory function to remove the item from the list
                                      deleteCategory(index);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
