angular.module('todolist').controller('table', ['$scope','$state','api', function($scope,$state,api) {
    $scope.tasks = [];
    $scope.showCompleted = false;

    api.getAllTasks().then(function(response) {
        $scope.tasks = response.data.tasks;
    });

    $scope.newTask = function() {
        $state.go('new');
    }

    $scope.editTask = function(id) {
        $state.go('edit',{id:id});
    }

    $scope.finishTask = function(id) {
        api.finishTask(id);
        
        api.getAllTasks().then(function(response) {
            $scope.tasks = response.data.tasks;
        });
    }
}])