angular.module('todolist').controller('edit', ['$scope','$state','$stateParams','api', function($scope,$state,$stateParams,api) {
    $scope.form = {};
    var id = $stateParams.id;
    
    api.getTask(id).then(function(response) {
        $scope.form = angular.copy(response.data);
    });

    $scope.delete = function() {
        if(confirm('Are you sure you want to delete this task?')) {
            api.deleteTask(id,$scope.form);
            $state.go('table');
        }
    }
    
    $scope.save = function() {
        api.updateTask(id,$scope.form);
        $state.go('table');
    }

    $scope.cancel = function() {
        $state.go('table');
    }
}])
