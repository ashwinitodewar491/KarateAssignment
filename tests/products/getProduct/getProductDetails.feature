Feature: Adding product

Scenario Outline: 'Get product details'
    
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

    Examples:
  	| read('testDataForFetchingData.csv') | 