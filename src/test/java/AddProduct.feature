Feature: Adding product

	Scenario Outline: <Testname>
    Given url 'https://fakestoreapi.com/'
    And path 'products'
    And request <request>
    And headers <headers>
    When method post
    Then match response == <responseSchema>
    Then status 200
    Then assert response.id==21
    Then assert response.title=='test product'
    
    #Verify data
   Given url 'https://fakestoreapi.com/'
   And path 'products/', 2
   And headers <headers>
   When method get
   Then status 200
   #* def ratings = karate.read('classpath:src/test/java/LoopAssertion.js')(response);
   Then assert karate.read('classpath:src/test/java/LoopAssertion.js')(response);
   And print ratings
  # Then assert response.rating[0].count==259
   #Then assert response.rating[1].rate=4.1


    Examples:
  	| read('classpath:src/test/resources/create.csv') |
    
