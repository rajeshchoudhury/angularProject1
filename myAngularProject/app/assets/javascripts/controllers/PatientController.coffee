controllers = angular.module('controllers')
controllers.controller("PatientController", [ '$scope', '$routeParams', '$resource', '$location', 'flash', 'patientsFactory', '$modal', '$http'
  ($scope,$routeParams,$resource,$location,flash,patientsFactory,$modal,$http)->
    $scope.back   = -> $location.path("/patients")
    $scope.edit   = -> $location.path("/patient/#{$scope.patient.id}/edit")

    $scope.delete = ->
      $scope.patient.$delete()
      $scope.back()

    $scope.tabs =
      personal: true
      addresses: false
      more: false

    $scope.updateAppointments = (patientId) ->
      $http.get('/patient/'+patientId+'/appointments?format=json').success((data, status, headers, config) ->
            $scope.appointments = data
            return
          ).error (data, status, headers, config) ->
            flash.error   = "There was a problem with your request."
            return

    $scope.openEdit = (size) ->
      modalInstance = $modal.open(
        animation: $scope.animationsEnabled
        templateUrl: 'patient_form.html'
        controller: 'PatientModalController'
        size: size
      )
      modalInstance.result.then ((updatedPatient) ->
        $scope.patient = updatedPatient
        return
      ), ->
        console.log 'Modal dismissed at: ' + new Date
        return
      return

    $scope.openNewAppointment = (size) ->
      modalInstance = $modal.open(
        animation: $scope.animationsEnabled
        templateUrl: 'appointment_form.html'
        controller: 'AppointmentModalController'
        size: size
        resolve:
          appointmentId: ->
            return null
          patientId: ->
            return $scope.patient.id
      )
      modalInstance.result.then ((updatedPatient) ->
        console.log 'Appointment Added'
        return
      ), ->
        console.log 'Modal dismissed at: ' + new Date
        return
      return

    $scope.openEditAppointment = (size, appointmentId) ->
      modalInstance = $modal.open(
        animation: $scope.animationsEnabled
        templateUrl: 'appointment_form.html'
        controller: 'AppointmentModalController'
        size: size
        resolve:
          appointmentId: ->
            return appointmentId
          patientId: ->
            return null
      )
      modalInstance.result.then ((updatedPatient) ->
        $scope.updateAppointments($scope.patient.id)
        return
      ), ->
        console.log 'Modal dismissed at: ' + new Date
        return
      return
        
    if $routeParams.patientId
      patientsFactory.get({patientId: $routeParams.patientId},
        ( (patient)-> 
          $scope.patient = patient
          $scope.updateAppointments($scope.patient.id)
        ),
        ( (httpResponse)->
          $scope.patient = null
          flash.error   = "Client not found"
        )
      )
    else
      $scope.patient = {}
])