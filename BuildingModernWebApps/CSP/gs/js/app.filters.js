angular.module('todolist').filter('completed', function() {
    return function(tasks,showCompleted) {
        if(showCompleted) {
            return tasks;
        } else {
            var filtered = [];
            angular.forEach(tasks, function(task) {
                if(!!!task.completed) {
                    filtered.push(task);
                }
            });
            return filtered;
        }
    }
})
