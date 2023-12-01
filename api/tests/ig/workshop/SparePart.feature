Feature: To retrieve vehicle spare parts
  As a system user I want to retrieve spare parts available for policy vehicles

  Background:
    * def requestUrl = igBaseUrl + '/spareParts'
    * param modelCode = 'ASTRA'
    * param modelYear = '2012'
    * param sparePartType = 'MIRROR'

  Scenario: Try to get spare parts without required params
    Given url requestUrl
    When method GET
    Then assert responseStatus == 400

  Scenario: Get available spare parts from a vehicle
    Given url requestUrl
    And param brandCode = 'OPEL'
    When method GET
    Then assert responseStatus == 200

  Scenario: Get available spare parts from a vehicle that does not exist
    Given url requestUrl
    And param brandCode = 'A TEAM VAN'
    When method GET
    Then assert responseStatus == 404

  @id=GetFirstSparePart
  Scenario: Get first available spare part from a vehicle
    Given url requestUrl
    And param brandCode = 'OPEL'
    When method GET
    Then assert responseStatus == 200
    * setStepVariable('sparePart', response[0])