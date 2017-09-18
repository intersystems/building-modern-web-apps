angular.module('todolist').controller('new', ['$scope','$state','$stateParams','api', function($scope,$state,$stateParams,api) {
    $scope.form = {
        text: "",
        important: 0
    };
    
    $scope.save = function() {
        api.newTask($scope.form);
        $state.go('table');
    }

    $scope.cancel = function() {
        $state.go('table');
    }
}])
