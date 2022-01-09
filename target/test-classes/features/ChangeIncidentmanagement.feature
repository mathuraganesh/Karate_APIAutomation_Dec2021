Feature: Change Request Mangement

Scenario: Change Request Mangemant

Given url 'https://dev117099.service-now.com/api/now/table/change_request'
And header Authorization = 'Basic YWRtaW46eDVnMmVpQlJOZlFZ'
And header accept = 'application/json'
And param sysparm_fields = 'sys_id,short_description,number,category'

When method get

And print response