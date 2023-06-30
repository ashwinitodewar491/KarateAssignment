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
   And path 'products/', <Testdata>
   And headers <headers>	
   When method get
   Then status 200
   * def ResponseValidatorFunction = karate.read('../responseValidator.js')
   * def responseAssertionsResults = ResponseValidatorFunction(response,{'expRate':4.1,'expCount':259})
   * print responseAssertionsResults
   Then assert responseAssertionsResults
   
   #* def ratings = karate.read('classpath:src/test/java/LoopAssertion.js')(response);
   #Then assert karate.read('classpath:src/test/java/ResponseValidator.js')(response,{'expRate':4.1,'expCount':259});
   #And print ratings
  # Then assert response.rating[0].rate==4.1
   #Then assert response.rating[1].count=259


    Examples:
  	| read('testDataForCreatingData.csv') |
    
