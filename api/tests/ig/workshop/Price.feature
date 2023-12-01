Feature: To get prices
  As a system user I want to get the price of a product in a specific time

  Background:
    * def requestUrl = igBaseUrl + '/prices'
    * param date = '2020-06-14-10.00.00'

  Scenario: Try to get a price without required params
    Given url requestUrl
    When method GET
    Then assert responseStatus == 400

  @id=GetPrice
  Scenario: Get price of a product
    Given url requestUrl
    And param productId = '2'
    When method GET
    Then assert responseStatus == 200
    * setStepVariable('price', response)

  Scenario: Try to get the price of a product that doesn't exist
    Given url requestUrl
    And param productId = '3'
    When method GET
    Then assert responseStatus == 404