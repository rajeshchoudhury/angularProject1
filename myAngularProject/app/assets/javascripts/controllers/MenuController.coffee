controllers = angular.module('controllers')
controllers.controller('MenuController', [ '$scope', '$location', '$timeout', '$window', 'flash', '$http'
  ($scope,$location,$timeout,$window,flash,$http)->

    $scope.isRoot = ->
      $location.path().length == 1

    $scope.isActive = (path) ->
      if $location.path().substr(0, path.length) == path
        true
      else
        false

    $scope.toSchedule = () ->
      $location.path("/appointments")

    $scope.toClients = () ->
      $location.path("/patients")

    $scope.alertShow = true

    $scope.logout = ->
      $http(
        method: 'DELETE'
        url: '/users/sign_out.json'
        data: {}).success(->
        $window.location.reload();
        return
      ).error ->
        flash.error   = "Problem on logout."
        return

    $scope.home = ->
      $location.path("/")

    hideAlert = () ->
      $scope.alertShow = false

    $timeout(hideAlert, 2000)
])