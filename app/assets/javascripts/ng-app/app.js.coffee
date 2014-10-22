app = angular.module("omdbapi", [
  "ngRoute"
  "templates"
  "ngResource"
  "ngSanitize"
])

app.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider
    .when "/",
      templateUrl: "index.html"
      controller: "IndexCtrl"
    .when "/search",
      templateUrl: "index.html"
      controller: "SearchCtrl"
    .when "/movie/:id",
      templateUrl: "index.html"
      controller: "MovieCtrl"

app.controller "IndexCtrl", ($scope, $http) ->

app.controller "SearchCtrl", ($scope, $http, $routeParams) ->
  $http.get("http://www.omdbapi.com/?s=" + $routeParams.t ).success (data) ->
    $scope.search = $routeParams.t.replace('+', ' ')
    $scope.movies = data.Search
    $scope.error = data.Error

app.controller "MovieCtrl", ($scope, $http, $routeParams) ->
  $http.get("http://www.omdbapi.com/?i=" + $routeParams.id ).success (data) ->
    $scope.movie = data
    $scope.good_or_bad = parseInt(data.imdbRating) > 5


