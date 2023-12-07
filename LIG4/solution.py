def breakLine(line):
	line = line.strip()
	result = []
	for i in range(len(line)):
		result.append(line[i])
	return result

def changePlayer(player):
	if player == 'V':
		return 'A'
	else:
		return 'V'

def findHorizontal(table, size):
	current, count = '', 0

	for i in table:
		if count == size:
			return current
			
		current, count = '', 0
		for j in i:
			if count == size:
				return current
			elif j == current:
				count += 1
			elif j != '.' and current == '':
				current = j
				count = 1
			elif j == '.':
				current = ''
				count = 0
			else:
				current = changePlayer(current)
				count = 1
	if count == size:
		return current
	else:
		return False

def findVertical(table, size):
	current, count = '', 0
	j = 0

	while j < len(table[0]):
		for i in table:
			if count == size:
				return current
			elif i[j] == current:
				count += 1
			elif i[j] != '.' and current == '':
				current = i[j]
				count = 1
			elif i[j] == '.':
				current = ''
				count = 0
			else:
				current = changePlayer(current)
				count = 1
		if count == size:
			return current
		else:
			j += 1
			count = 0
	if count == size:
		return current
	else:
		return False

def findDiagonal1(table, size):
	current, count = '', 0
	X, Y = 0, 0

	while Y < len(table) - size + 1:
		X = 0
		while X < len(table[0]) - size + 1:
			if table[Y][X] == '.':
				current, count = '', 0
				X += 1
				continue
			else:
				current = table[Y][X]
			
			for i in range(size):
				if table[Y + i][X + i] == current:
					count += 1
				else:
					current, count = '', 0
					X += 1
					break
			
			if count == size:
				return current
		Y += 1
	return False

def findDiagonal2(table, size):
	current, count = '', 0
	X, Y = len(table[0]) - 1, 0

	while Y < len(table) - size + 1:
		X = len(table[0])-1
		while X > 2:
			if table[Y][X] == '.':
				current, count = '', 0
				X -= 1
				continue
			else:
				current = table[Y][X]
			
			for i in range(size):
				if table[Y + i][X - i] == current:
					count += 1
				else:
					current, count = '', 0
					X -= 1
					break
			
			if count == size:
				return current
		Y += 1
	return False

def changeFull(player):
	if player == 'V':
		return 'Vermelho'
	else:
		return 'Azul'

n, m = map(int, input().strip().split())
board = []
for i in range(n):
	board.append(breakLine(input()))

# The original problem has as 4, but the code is programmed to work with other sizes. However, there is no way to input said size, it is hardcoded.
sizeMatch = 4

if findVertical(board, sizeMatch) != False:
	print(f'{changeFull(findVertical(board, sizeMatch))} na vertical')
elif findHorizontal(board, sizeMatch) != False:
	print(f'{changeFull(findHorizontal(board, sizeMatch))} na horizontal')
elif findDiagonal1(board, sizeMatch) != False:
	print(f'{changeFull(findDiagonal1(board, sizeMatch))} na diagonal')
elif findDiagonal2(board, sizeMatch) != False:
	print(f'{changeFull(findDiagonal2(board, sizeMatch))} na diagonal')
