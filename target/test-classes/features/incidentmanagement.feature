Feature: Incident Mangement

Scenario: Get the Incident

Given url 'https://dev117099.service-now.com/api/now/table/incident'
And header Authorization = 'Basic YWRtaW46eDVnMmVpQlJOZlFZ'
And header accept = 'application/xml'
And param sysparm_fields = 'sys_id,short_description,number,category'
When method get
And print response
Then status 200
Then match responseType == 'xml'


Scenario: Create The Incident Without Body

Given url 'https://dev117099.service-now.com/api/now/table/incident'
And header Authorization = 'Basic YWRtaW46eDVnMmVpQlJOZlFZ'
And header content-type = 'appllication/json'
And request {}
When method post
And print response
Then status 201
Then match responseType == 'json'

Scenario: Create the Incident With Body

Given url 'https://dev117099.service-now.com/api/now/table/incident'
And header Authorization = 'Basic YWRtaW46eDVnMmVpQlJOZlFZ'
And header content-type = 'appllication/json'
And request {"short_description":"Create the Incident in Karate Framework","category":"hardware"}
When method post
And print response
Then status 201
And def SYS_ID = response.result.sys_id
Then match responseType == 'json'
Then match response.result.short_description == 'Create the Incident in Karate Framework'
Then match response.result.sys_id == SYS_ID

Scenario: Create the Incident with Body From File

Given url 'https://dev117099.service-now.com/api/now/table/incident'
And header Authorization = 'Basic YWRtaW46eDVnMmVpQlJOZlFZ'
And header content-type = 'appllication/json'
And request karate.readAsString("CreateIncident.json")
When method post
And print response
Then status 201
Then match responseType == 'json'
Then match response.result.category == 'software'

Scenario: Update the Incident with Body

Given url 'https://dev117099.service-now.com/api/now/table/incident/'+SYS_ID
And header Authorization = 'Basic YWRtaW46eDVnMmVpQlJOZlFZ'
And header content-type = 'appllication/json'
And request {"short_description":"Update the Incident in Karate Framework","category":"hardware"}
When method put
And print response
Then status 201
Then match responseType == 'json'
Then match response.result.short_description == 'Update the Incident in Karate Framework'



