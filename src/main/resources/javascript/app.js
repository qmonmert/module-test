angular.module('app', []);

angular
    .module('app')
    .config(function($locationProvider) {
        $locationProvider.html5Mode(true);
    })
    .controller('MyController', MyController);

function MyController() {
    var vm = this;
    vm.title = "This is an angular app";
}