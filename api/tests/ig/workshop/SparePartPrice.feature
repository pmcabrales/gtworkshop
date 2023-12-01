@IGWorkshop
Feature: To get and compare prices for spare parts
  As a system user I want to get the price of a spare part in a specific time

Scenario: Price of the OPEL Astra mirror has a 10% yearly increment in price
  Given step('SparePart.GetFirstSparePart', {'scenarioArgs': {'brandCode':'OPEL','modelCode':'ASTRA','modelYear':'2012','sparePartType':'MIRROR'}})
  * def sparePart = getStepVariable('SparePart.GetFirstSparePart','sparePart')
  And step('Price.GetPrice', {'scenarioArgs': {'productId':sparePart.sparePartId, 'date':'2023-12-31-18.30.00'}})
  * def oldPrice = getStepVariable('Price.GetPrice','price')
  And step('Price.GetPrice', {'scenarioArgs': {'productId':sparePart.sparePartId, 'date':'2024-01-01-09.10.00'}})
  * def newPrice = getStepVariable('Price.GetPrice','price')
  * def oldPricePlusIncrement = parseFloat(oldPrice) * 1.1
  * print oldPricePlusIncrement
  Then assert parseFloat(newPrice) == oldPricePlusIncrement


