# Planned features to add:
# 1. Option to choose page number

# This dictionary handles the commands of the program. Used as parameter in the function.
# Keys refer to the string that will be sent over to the processing stage.
# Values are the flavor text displayed in the list.
commands = {
    "command1": "Flavor text 1",
    "command2": "Flavor text 2",
    "command3": "Flavor text 3",
    "command4": "Flavor text 4",
    "command5": "Flavor text 5",
    "command6": "Flavor text 6",
    "command7": "Flavor text 7",
    "command8": "Flavor text 8",
    "command9": "Flavor text 9",
    "command10": "Flavor text 10",
    "command11": "Flavor text 11",
    "command12": "Flavor text 12",
    "command13": "Flavor text 13",
    "command14": "Flavor text 14",
    "command15": "Flavor text 15",
    "command16": "Flavor text 16",
    "command17": "Flavor text 17",
    "command18": "Flavor text 18",
    "command19": "Flavor text 19",
    "command20": "Flavor text 20",
    "command21": "Flavor text 21"
}


def menuResolver(commandDict:dict, title:str="Main Menu"):
    if type(commandDict) != dict:
        raise TypeError("Paramenter must be a dictionary")
    if type(title) != str:
        raise TypeError("Paramenter must be a string")
    
    print()
    print("-"*(len(title) + 5))
    print(title)
    print("-"*(len(title) + 5))


    print("Type in your command from the list below:")
    
    if len(commandDict) <= 9:
        # generate normal list
        
        pages = list(commandDict.keys()) # list containing the commands

        for i in range(len(pages)):
            print(f"{i + 1}. {commandDict[pages[i]]}")
        print("0. Exit the program")

        while True:
            try:
                print()
                commandInput = int(input("Command number: ").strip())
            except:
                print('Please write a valid number.')
                continue

            if commandInput in range(10):
                if commandInput == 0:
                    return "exit"
                else:
                    return pages[commandInput - 1]
            else:
                print('Please write a valid number.')
                continue

    else:
        # generate more than one list

        pages = [] # list of lists containing the pages of commands
        pages.append(list(commandDict.keys())[0:8])

        iterations = (len(commandDict) - 8) // 7
        for i in range(1, iterations + 2):
            pages.append(list(commandDict.keys())[i*7 + 1 : (i+1)*7 + 1])

        currentPage = 0 # keeps track of what page user is
        pageMovement = 0

        while True:
            # prints the current page

            currentPage += pageMovement

            print()
            print(f"\nPage {currentPage + 1} / {len(pages)}\n")
            print()

            # handles the commands
            i = 0
            while i < len(pages[currentPage]):
                print(f"{i + 1}. {commandDict[pages[currentPage][i]]}")
                i += 1
                
            # displays the page UI
            if currentPage == 0:
                print("9. Go to the next page ->")
                print("0. Exit the program")
            elif currentPage == len(pages) - 1:
                print("8. Go to the previous page <-")
                print("0. Exit the program")
            else:
                print("8. Go to the previous page <-")
                print("9. Go to the next page ->")
                print("0. Exit the program")

            while True:
                try:
                    print()
                    commandInput = int(input("Command number: ").strip())
                except:
                    print('Please write a valid number.')
                    continue

                if commandInput in range(10):
                    if commandInput == 0:
                        return "exit"
                    elif commandInput > len(pages[currentPage]):
                        # handles the page UI
                        if commandInput == 9 and not(currentPage == len(pages) - 1):
                            pageMovement = 1
                            break
                        elif commandInput == 8:
                            pageMovement = -1
                            break
                        else:
                            print('Please write a valid number.')
                            continue
                    else:
                        return str(pages[currentPage][commandInput - 1])
                else:
                    print('Please write a valid number.')
                    continue
    return "error"




while True:
    # Write the code here!
    # It is recommended to store the function result in a variable and read it as needed.

    print(f"\nThe function resolved in the following keyword: \"{menuResolver(commands)}\"")
    
    break
