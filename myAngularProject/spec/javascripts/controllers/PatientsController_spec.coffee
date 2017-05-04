describe "PatientsController", ->
  scope        = null
  ctrl         = null
  location     = null
  routeParams  = null
  httpBackend  = null
  resource     = null

  fakePatients = [
    {
      id: 1
      name: 'Raoni Boaventura'
      email: 'raoni@gmail.com'
      sex: 'Male'
    }
    {
      id: 2
      name: 'Lionel Messi'
      email: 'messi@gmail.com'
      sex: 'Male'
    }
  ]

  setupController =(keywords)->
    inject(($location, $routeParams, $rootScope, $httpBackend, $resource, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      httpBackend = $httpBackend
      resource    = $resource
      routeParams = $routeParams
      routeParams.keywords = keywords

      results = [200,fakePatients]

      httpBackend.expectGET('/patients?format=json').respond(results[0],results[1])
      httpBackend.expectGET('/patients?format=json&keywords=').respond(results[0],results[1])

      ctrl = $controller('PatientsController',
        $scope: scope
        $location: location)
    )

  beforeEach(module("shibata"))
  beforeEach(setupController())

  it 'defaults to all patients', ->
    httpBackend.flush()
    expect(scope.patients).toEqualData(fakePatients)