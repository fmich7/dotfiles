import random
array = str(input()).split(",")
sz = sorted(array, key = lambda x: random.random())
print(','.join(sz))
