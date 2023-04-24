import random
from prefix import Prefix
from root import Root
from suffix import Suffix

def choose(list):
    choice = random.choice(list)
    word = choice[0]
    definition = choice[1]
    result = [word, definition]
    return result

def putTogether(x,y,z):
    result = x + y + z
    return result

ok = Prefix()
ok2 = Root()
ok3 = Suffix()
first = choose(ok.list)
second = choose(ok2.list)
third = choose(ok3.list)

num = int(input("How many words? "))
for i in range(num):
    first = choose(ok.list)
    second = choose(ok2.list)
    third = choose(ok3.list)
    horrray = putTogether(first[0],second[0],third[0])
    print(horrray)
    print("")
    horrrray = putTogether(third[1]+" ", first[1]+" ", second[1])
    print(horrrray)
    print("")
