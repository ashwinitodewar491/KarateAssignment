Feature: Create booking End to End scenario

    Scenario Outline: <Testname>
        * def tokenGeneratorFunction = karate.read('authenticationTokenGenerator.js')
        * def tokenGenartoRresult = tokenGeneratorFunction('admin','password123')

        Given url 'https://restful-booker.herokuapp.com/'
        And path 'booking'
        And request <request>
        And header Accept = '*/*'
        When method post
        Then status 200
        Then assert response.booking.firstname=='Jimmy'
        Then assert response.booking.lastname=='Brown'
        Then assert response.booking.totalprice==111
        * def bookingid = response.bookingid

        #Verify if booking is created
        Given  url 'https://restful-booker.herokuapp.com/'
        And path 'booking',bookingid
        And header Accept = 'application/json'
        When method get
        Then status 200

        #Update Booking
        Given  url 'https://restful-booker.herokuapp.com/'
        And path 'booking',bookingid
        And header Accept = 'application/json'
        And header Authorization = tokenGenartoRresult
        And request <updatedRequest>
        When method put
        Then status 200

        #Delete Booking
        Given  url 'https://restful-booker.herokuapp.com/'
        And path 'booking',bookingid
        And header Accept = 'application/json'
        And header Authorization = tokenGenartoRresult
        When method Delete
        Then status 201

    Examples:
    | read('createBookingTestData.csv') |