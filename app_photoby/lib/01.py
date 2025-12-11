count = 0

while count < 10:
    count += 1
    print(count)
else:
    print("It's over, thank you ")
    
multiplicador = int(input("type the number to multiplicate: "))

for i in range(1, 11):
    multiplica = i * multiplicador
    print(f'{multiplicador}x{i}={multiplica}')
    
if multiplica == 6:
    print("the number 6 always exists")
else:
    print("doesn't exist")