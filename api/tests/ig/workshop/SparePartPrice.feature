Feature: To get prices for spare parts
  As a system user I want to get the price of a spare part in a specific time

Scenario: Get price from the first spare part returned by the search
  Given step('SparePart.GetFirstSparePart', {'scenarioArgs': {'brandCode':'OPEL'}})
  * def sparePart = getStepVariable('SparePart.GetFirstSparePart','sparePart')
  And step('Price.GetPrice', {'scenarioArgs': {'productId':sparePart.sparePartId}})
  * def price = getStepVariable('Price.GetPrice','price')
  Then assert price == '35.5 EUR'

