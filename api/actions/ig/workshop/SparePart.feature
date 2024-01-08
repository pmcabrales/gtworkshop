#TODO: Add tag
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

  @id=GetFirstSparePart
  #TODO: ignore the step. Cannot execute it individually
  Scenario: Get first available spare part from a vehicle
    * def requiredArguments = ['brandCode','modelCode','modelYear','sparePartType']
    Given url requestUrl
    And param brandCode = scenarioArgs.brandCode
    And param modelCode = scenarioArgs.modelCode
    And param modelYear = scenarioArgs.modelYear
    And param sparePartType = scenarioArgs.sparePartType
    When method GET
    Then assert responseStatus == 200
    * setStepVariable('sparePart', response[0])