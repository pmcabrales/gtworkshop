Feature: To get prices
  As a system user I want to get the price of a product in a specific time

  Background:
    * def requestUrl = igBaseUrl + '/prices'

  Scenario: Try to get a price without required params
    Given url requestUrl
    When method GET
    Then assert responseStatus == 400

  Scenario: Try to get the price of a product that doesn't exist
    Given url requestUrl
    And param productId = '3'
    And param date = '2023-06-14-10.00.00'
    When method GET
    Then assert responseStatus == 404

  Scenario: Get  the price of a test product
    Given url requestUrl
    And param productId = '2'
    And param date = '2023-06-14-10.00.00'
    When method GET
    Then assert responseStatus == 200
    And assert response == '35.5 EUR'

  #TODO: Create a new scenario to get the price of a product
  #It will receive 2 arguments ['productId','date']
  #Set the response in a step variable
  #Remember to tag it as a callable step

