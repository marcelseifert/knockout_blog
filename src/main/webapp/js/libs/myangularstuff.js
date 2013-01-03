/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function Controller($scope) {
  $scope.todos = [
    {text:'learn angular', done:true},
    {text:'build an angular app', done:false}];
 
  $scope.addTodo = function() {
    $scope.todos.push({text:$scope.todoText, done:false});
    $scope.todoText = '';
  };
  
  $scope.mystuff = [
      {name:"hallo", key:"test"}
  ];
 
  $scope.remaining = function() {
    var count = 0;
    angular.forEach($scope.todos, function(todo) {
      count += todo.done ? 0 : 1;
    });
    return count;
  };
 
  $scope.archive = function() {
    var oldTodos = $scope.todos;
    $scope.todos = [];
    angular.forEach(oldTodos, function(todo) {
      if (!todo.done) $scope.todos.push(todo);
    });
  };
}



angular.module('myIncectionExample', []).
  // Declare new object call time,
  // which will be available for injection
  factory('serviceA', function() {
    
    return "MyIncetion";
  });
 
// Notice that you can simply ask for time
// and it will be provided. No need to look for it.
function InjectionCtrl($scope, serviceA) {
  $scope.service = serviceA;
}