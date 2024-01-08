Feature: To retrieve vehicle spare parts
  As a system user I want to retrieve spare parts available for policy vehicles

  Background:
    * def requestUrl = igBaseUrl + '/spareParts'

  Scenario: Get available spare parts from a vehicle
    Given url requestUrl
    And param brandCode = 'OPEL'
    And param modelCode = 'ASTRA'
    And param modelYear = '2012'
    And param sparePartType = 'MIRROR'
    When method GET
    Then assert responseStatus == 200

  Scenario: Try to get spare parts without required params
    Given url requestUrl
    When method GET
    Then assert responseStatus == 400

  Scenario: Get available spare parts from a vehicle that does not exist
    Given url requestUrl
    And param brandCode = 'A TEAM VAN'
    And param modelCode = 'ASTRA'
    And param modelYear = '2012'
    And param sparePartType = 'MIRROR'
    When method GET
    Then assert responseStatus == 404

  #TODO: Create a new scenario to get the first available spare part from a vehicle
  #It will receive 4 arguments ['brandCode','modelCode','modelYear','sparePartType']
  #Set the response in a step variable
  #Remember to tag it as a callable step