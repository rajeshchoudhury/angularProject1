services = angular.module('services')
services.factory('appointmentsFactory', [ '$resource', 
  ($resource) ->
    $resource('/appointments/:appointmentId', { appointmentId: "@id", format: 'json' },
      {
        'save':   {method:'PUT'},
        'create': {method:'POST'}
      }
    )
])