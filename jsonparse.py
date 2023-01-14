import json
from jsonpath_ng import jsonpath, parse

f=open('results.json', encoding="utf8")
data = json.load(f)
# print(data)
jsonpath_expression = parse('$.Results[*].[Vulnerabilities][0].[VulnerabilityID]')
#jsonpath_expression = parse('$.Results[*].[Vulnerabilities][0].[VulnerabilityID]')
match= jsonpath_expression.find(data)

print(match)

# print(data)
# for i in data:
#     print(i["Results"][0]["Vulnerabilities"][0]["VulnerabilityID"])
