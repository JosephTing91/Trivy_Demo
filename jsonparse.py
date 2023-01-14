import json

f=open('log.json', encoding="utf8")
data = json.load(f)

# print(data)

# for i in data:
#     print(i["Results"][0]["Vulnerabilities"][0]["VulnerabilityID"])

for i in data:
     print(i["Results"])