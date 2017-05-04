shibata = angular.module('shibata',[
  'templates',
  'controllers',
  'services',
  'ngRoute',
  'ngResource',
  'ngAnimate',
  'ui.bootstrap',
  'angular-flash.service',
  'angular-flash.flash-alert-directive',
  'angular-loading-bar'
])

shibata.config([ '$routeProvider', 'flashProvider',
  ($routeProvider,flashProvider)->

    flashProvider.errorClassnames.push("alert-danger")
    flashProvider.warnClassnames.push("alert-warning")
    flashProvider.infoClassnames.push("alert-info")
    flashProvider.successClassnames.push("alert-success")

    $routeProvider
      .when('/',
        templateUrl: "appointments.html"
        controller: 'AppointmentsController'
      ).when('/patients',
        templateUrl: "patients.html"
        controller: 'PatientsController'
      ).when('/patients/:keywords',
        templateUrl: "patients.html"
        controller: 'PatientsController'
      ).when('/patient/:patientId/view',
        templateUrl: "patient.html"
        controller: 'PatientController'
      ).when('/patient/new',
        templateUrl: "patient_form.html"
        controller: 'PatientController'
      ).when('/patient/:patientId/edit',
        templateUrl: "patient_form.html"
        controller: 'PatientController'
      ).when('/appointments',
        templateUrl: "appointments.html"
        controller: 'AppointmentsController'
      )
])

controllers = angular.module('controllers',[])
services = angular.module('services',[])