controllers = angular.module('controllers')
controllers.controller("PatientModalController", [ '$scope', '$routeParams', '$location', 'flash', 'patientsFactory', '$modalInstance'
  ($scope,$routeParams,$location,flash,patientsFactory,$modalInstance)->

    $scope.submitted = false

    $scope.dismiss = () ->
      $modalInstance.dismiss()

    $scope.delete = ->
      $scope.patient.$delete()
      $scope.back()

    $scope.save = ->
      $scope.submitted = true 

      onError = (_httpResponse)-> 
          flash.error = "Please, check all the required fields."

      if $scope.patientForm.$error.required?
        flash.error = "Please, check all the required fields."

      else
        flash.error = ""
        if $scope.patient.id
          $scope.patient.$save(
            ( ()-> $modalInstance.close($scope.patient) ),
            onError)
        else
          patientsFactory.create($scope.patient,
            ( (newPatient)-> 
                $location.path("/patient/#{newPatient.id}/view")
                $modalInstance.close()
            ),
            onError)

    $scope.patientId = $routeParams.patientId

    if $routeParams.patientId
      patientsFactory.get({patientId: $routeParams.patientId},
        ( (patient)-> $scope.patient = patient ),
        ( (httpResponse)->
          $scope.patient = null
          flash.error   = "Client not found"
        )
      )
    else
      $scope.patient = {}
])