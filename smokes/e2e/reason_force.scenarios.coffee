# coffee script
# test goal: checks the capability to define a reason and to cancel/start the build


forcePage = require('./force.coffee')
builderPage = require('./builder.coffee')

describe('', () ->
    force = null
    builder = null

    beforeEach(() ->
        builder = new builderPage('runtest', 'force')
        force =  new forcePage()
        builder.goDefault()
    )

    describe 'force', () ->
        it 'should create a build', () ->
            builder.go()
            builder.getLastSuccessBuildNumber().then (lastbuild) ->
                builder.goForce()
                force.getStartButton().click()
                builder.go()
                builder.waitNextBuildFinished(lastbuild)

    describe 'forceandcancel', () ->
        it 'should create a build with a dedicated reason and cancel it', () ->

            builder.go()
            builder.goForce()
            force.getCancelButton().click()

    describe 'forceandstart', () ->
        it 'should create a build with a dedicated reason and Start it', () ->

            builder.go()
            builder.goForce()
            force.setReason("New Test Reason")
            force.setYourName("FaceLess User")
            force.setProjectName("BBOT9")
            force.setBranchName("Gerrit Branch")
            force.setRepo("http//name.com")
            force.setRevisionName("12345")
            force.getStartButton().click()

)
