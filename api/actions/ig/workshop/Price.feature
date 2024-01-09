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

  #TODO: Create a new scenario to get the price of a test product
  #use productId = '2' and param date = '2023-12-12-10.00.00'

