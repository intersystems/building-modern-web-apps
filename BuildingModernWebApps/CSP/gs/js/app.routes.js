angular.module('todolist').config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
    $stateProvider.state('table', {
        url: '/',
        templateUrl: 'views/table.html',
        controller: 'table'
    }).state('new', {
        url: '/new',
        templateUrl: 'views/new.html',
        controller: 'new'
    }).state('edit', {
        url: '/edit/:id',
        templateUrl: 'views/edit.html',
        controller: 'edit'
    });
    $urlRouterProvider.otherwise('/');
}])
