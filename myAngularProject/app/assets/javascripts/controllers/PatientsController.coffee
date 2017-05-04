controllers = angular.module('controllers')
controllers.controller("PatientsController", [ '$filter', '$http', '$scope', '$routeParams', '$location', 'patientsFactory', '$modal'
  ($filter,$http,$scope,$routeParams,$location,patientsFactory,$modal)->

    $scope.search = (keywords)->  $location.path("/patients/#{keywords}")
    $scope.view = (patientId)-> $location.path("/patient/#{patientId}/view")
    $scope.edit = (patientId)-> $location.path("/patient/#{patientId}/edit")
    $scope.keywords = $routeParams.keywords ? ""
    $scope.showing = $routeParams.keywords
    $scope.openNew = (size) ->
      modalInstance = $modal.open(
        animation: $scope.animationsEnabled
        templateUrl: 'patient_form.html'
        controller: 'PatientModalController'
        size: size
      )
      modalInstance.result.then ((updatedPatient) ->
        return
      ), ->
        console.log 'Modal dismissed at: ' + new Date
        return
      return

    orderBy = $filter('orderBy');
    $scope.order = (predicate, reverse) ->
      $scope.patients = orderBy($scope.patients, predicate, reverse)
      return

    $scope.$watch('keywords',
      (keywords) ->
        patientsFactory.query(keywords: keywords, (results)-> $scope.patients = results)
      ,true)

    if $routeParams.keywords
      patientsFactory.query(keywords: $routeParams.keywords, (results)-> $scope.patients = results)
    else
      patientsFactory.query((results)-> $scope.patients = results)
])