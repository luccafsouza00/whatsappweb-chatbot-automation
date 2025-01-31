*** Settings ***
Library     SeleniumLibrary    timeout=5
Library     OperatingSystem
Library     FakerLibrary    locale=pt_BR
Library     JSONLibrary
Library     Collections
Library     DateTime
Library     String

Variables    ../Resources/locators.yaml

Resource    ../Resources/keywords.resource
