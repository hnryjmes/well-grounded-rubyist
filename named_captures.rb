re = /(?<first>\w+)\s+((?<middle>\w\.)\s+)?(?<last>\w+)/
m = re.match("David A. Black")
print m[:first]
