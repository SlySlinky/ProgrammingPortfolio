import random

print(
  "Hello USER! Welcome to the number guessing game where the wits of the USER will be tested against the Computer with 16GB RAM and an M1 processor. Now, please input a number between 0 and 101"
)

randNum = random.randint(1, 100)
attempts = 0

while True:
  guess = input("")
  try:
    guess = int(guess)
    
    if (guess < 1 or guess > 100):
      
      print("That is not a valid guess.")
      
    if (guess != randNum and guess > 0 and guess < 101):
      attempts = attempts + 1
      
      print("Computer - " + str(attempts) + " USER - 0")
      
      if (guess > randNum):
        
        print(
          "That is higher than the number that the Computer is thinking of. The USER likely \nhas less than 4MB RAM."
        )
        
      elif (guess < randNum):
        
        print(
          "That number is too low. Your processing capabilities are worse than a TI - 85 \ncalculator."
        )
        
    if (guess == randNum):
      attempts = attempts + 1
      
      print(
        "The USER has superior RAM and processor capabilities. The Computer admits defeat. Computer - ERROR \nUSER - WIN with " + str(attempts) + " tries. \nDo you want to play again?")
      
      again = input("")
      
      if "y" in again and not "n" in again:
        
        print(
          "Hello USER! Welcome to the number guessing game where the wits of the USER will be tested against the Computer with 16GB RAM and an M1 processor. Now, please input a number between 0 and 101"
        )
        
      randNum = random.randint(1, 100)
      attempts = 0
      
      if "y" not in again:
  
        print("see ya!")
        
        break
  except:
    print("That is not a valid guess.")