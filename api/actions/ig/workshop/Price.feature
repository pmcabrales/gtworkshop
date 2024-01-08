#TODO: Add tag
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

  @id=GetPrice
  #TODO: ignore the step. Cannot execute it individually
  Scenario: Get price of a product
    * def requiredArguments = ['productId','date']
    Given url requestUrl
    And param productId = scenarioArgs.productId
    And param date = scenarioArgs.date
    When method GET
    Then assert responseStatus == 200
    * setStepVariable('price', response)

