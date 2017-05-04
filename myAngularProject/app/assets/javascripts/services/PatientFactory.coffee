services = angular.module('services')
services.factory('patientsFactory', [ '$resource', 
  ($resource) ->
    $resource('/patients/:patientId', { patientId: "@id", format: 'json' },
      {
        'save':   {method:'PUT'},
        'create': {method:'POST'}
      }
    )
])