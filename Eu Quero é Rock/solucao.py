# ==== data input ====

n_lines = int(input())
email_list = []
email_words = []
for i in range(n_lines):
	email_list.append(input())  # makes a list of each line of the email
for i in email_list:
	email_words.extend(i.split())  # makes a list with all the words (separated by ' ')


# ==== data processing ====

# returns (str band, str show) in order; returns False if it finds none (failsafe)
# uses email_list
def findBandAndShowName(text_list):
	for i in text_list:
		if i.find('"') != -1:
			# finds the start and end of the band name
			start_b = i.find('"') + 1
			end_b = i.find('"', start_b)

			# makes start_s the exact index of the start of the show name
			if i.find('turnê') != -1:
				start_s = i.find('turnê') + 6
			elif i.find('espetáculo') != -1:
				start_s = i.find('espetáculo') + 11
			else:
				start_s = i.find('show') + 5
			
			# makes end_s the exact index of the end of the show name
			end_s = len(i)
			for j in ['.', ',', ';', '!', '?']:
				if i.find(j, start_s) != -1 and i.find(j, start_s) < end_s:
					end_s = i.find(j, start_s)
			
			return i[start_b : end_b], i[start_s : end_s]
	return False, False


# returns str already formatted city-uf; returns False if there's none
# uses email_list
def findCityUF(text_list):
	UF_list = ['AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO']
	for i in text_list:
		for j in UF_list:
			if i.find(j) != -1:
				# finds the end of the UF
				end_c = i.find(j) + 2

				# finds the start of the city name (searches backward with rfind, starting at 0 and ending at the last comma before end_c)
				start_c = i.rfind(' ', 0, i.rfind(',', 0, end_c))

				if start_c == -1:
					start_c = 0  # case where the city is the first thing in the string

				return i[start_c : end_c].strip().replace(' ', '').replace(',', '-')
	return False


# returns list with the dates; returns False if there is no dates
# uses email_list
def findDates(text_list):
	for i in text_list:
		aux = 0
		while True:
			if aux == -1 or i.find('/', aux + 1) == -1:
				break  # '#/' is not found
			else:
				if i[i.find('/', aux + 1) - 1].isnumeric():
					return findDatesProcessing(i)  # '#/' is found
				else:
					aux = i.find('/', aux + 1) + 1
					continue
	return False

def findDatesProcessing(sentence):
	date_type = sentence[sentence.find('/') + 1].isnumeric()  # True - ##/##  False ##/aaa
	aux = sentence.find('/')
	result = []

	# adds dates until there are no more
	while aux != -1:
		if date_type:  # date ##/##
			result.append(sentence[aux - 2 : aux + 3])
			aux = sentence.find('/', aux + 1)
		else:  # date ##/aaa
			result.append(sentence[aux - 2 : aux + 4])
			aux = sentence.find('/', aux + 1)
	
	return result


# returns str name of the show's location; returns False if there is no location
# uses email_list
def findShowLocation(text_list):
	sentence = []
	for i in text_list:
		if i.find('"') != -1:
			sentence.append(i)
	
	# returns out if there is no sentence with '"' (failsafe, there should at least there be the band name)
	if len(sentence) == 0:
		return False

	# removes the first mention if there are more than two sets of '"'
	if len(sentence) == 2:
		sentence.pop(0)
	sentence = sentence[0]  # list -> str
	
	# reverse finds the position of the correct '"'
	end_sl = sentence.rfind('"')
	start_sl = sentence[0 : end_sl].rfind('"')

	return sentence[start_sl + 1 : end_sl]


# returns str coupon, return False if no coupon is found
# uses email_words
def findCoupon(text_words):
	for i in text_words:
		if not(i.islower()):
			# adds one to every uppercase character it finds
			count = sum(1 for j in i if j.isupper())

			if count >= 3:
				# looks through each and every character of the coupon and removes all non-alpha characters (retains capitalization!)
				return ''.join(k for k in i if k.isalpha())
	return False


# returns str website; returns False if there is no website (failsafe)
# uses email_words
def findWebsite(text_words):
	for i in text_words:
		if i.find('.') != -1 and i.find('.') != (len(i) - 1) and i[i.find('.') - 1].islower() and i[i.find('.') + 1].islower():
			if not(i[-1].isalpha()):
				i = i[:len(i) - 1]
			if not(i[0].isalpha()):
				i = i[1:]
			return i
	return False


# returns str price(.2f); returns False if there is none (failsafe)
# uses email_list
def findPrice(text_list):
	for i in text_list:
		if i.find('R$') != -1 or i.find('reais') != -1:
			if i.find('R$') != -1:
				# R$ X
				start_p = i.find('R$') + 3
				end_p = i.find(' ', start_p)

				result = i[start_p : end_p].replace(',', '.')
				while not(result[-1].isnumeric()):
					result = result[0 : len(result) - 1]
				result = float(result)

				return f'{result:.2f}'
			else:
				# X reais
				end_p = i.find('reais') - 1
				start_p = i.rfind(' ', 0, end_p - 1) + 1

				result = i[start_p : end_p].replace(',', '.')
				while not(result[-1].isnumeric()):
					result = result[0 : len(result) - 1]
				result = float(result)

				return f'{result:.2f}'
	return False


# basic bubble sort, returns bigger
def compareBiggest(current, new):
	if new != False and current < len(new):
		current = len(new)
	return current


# ==== data fetching ====

band, showname = findBandAndShowName(email_list)
cityuf = findCityUF(email_list)
dates = findDates(email_list)
place = findShowLocation(email_list)
website = findWebsite(email_words)
price = findPrice(email_list)
if price != False:
	price = 'Ingressos: R$ ' + price
coupon = findCoupon(email_words)
if coupon != False:
	coupon = 'Utilize o cupom ' + coupon

if band != False:
	biggest = len(band)

biggest = compareBiggest(biggest, showname)
biggest = compareBiggest(biggest, cityuf)
if dates != False:
	biggest = compareBiggest(biggest, dates[0])
biggest = compareBiggest(biggest, place)
biggest = compareBiggest(biggest, website)
biggest = compareBiggest(biggest, price)
biggest = compareBiggest(biggest, coupon)


# ==== output ====

# the basic format checks if the value was given (even if some are supposed to always be given ex. band)
# then it gets the length of the biggest minus the current one + 1
# and uses that for the padding calculations

print('#' * (biggest + 4))

if band != False:
    aux = biggest - len(band) + 1
    print('#' + ' ' * (aux // 2 + 1 if aux % 2 == 1 else aux // 2) + band.upper() + ' ' * (aux // 2) + ' #')

print('#' * (biggest + 4))

if showname != False:
    aux = biggest - len(showname) + 1
    print('#' + ' ' * (aux // 2 + 1 if aux % 2 == 1 else aux // 2) + showname + ' ' * (aux // 2) + ' #')

if cityuf != False:
    aux = biggest - len(cityuf) + 1
    print('#' + ' ' * (aux // 2 + 1 if aux % 2 == 1 else aux // 2) + cityuf + ' ' * (aux // 2) + ' #')

if place != False:
    aux = biggest - len(place) + 1
    print('#' + ' ' * (aux // 2 + 1 if aux % 2 == 1 else aux // 2) + place + ' ' * (aux // 2) + ' #')

if dates != False:
    for i in dates:
        aux = biggest - len(i) + 1
        print('#' + ' ' * (aux // 2 + 1 if aux % 2 == 1 else aux // 2) + i + ' ' * (aux // 2) + ' #')

print('#' * (biggest + 4))

if website != False:
    aux = biggest - len(website) + 1
    print('#' + ' ' * (aux // 2 + 1 if aux % 2 == 1 else aux // 2) + website + ' ' * (aux // 2) + ' #')

print('#' * (biggest + 4))

if price != False:
    aux = biggest - len(price) + 1
    print('|' + ' ' * (aux // 2 + 1 if aux % 2 == 1 else aux // 2) + price + ' ' * (aux // 2) + ' |')

if coupon != False:
    aux = biggest - len(coupon) + 1
    print('|' + ' ' * (aux // 2 + 1 if aux % 2 == 1 else aux // 2) + coupon + ' ' * (aux // 2) + ' |')

print('+' + '-' * (biggest + 2) + '+')
