class ATM:
    def __init__(self):
        self.balance = 10000

    # Check balance is used to check the available balance in the account
    def check_balance(self):
        print(f'Available balance: {self.balance:.2f}')

    # Deposit is used to deposit the amount in the account
    def deposit(self):
        try:
            amount = float(input('Enter deposit amount: '))

            if amount <= 0:
                print('Amount must be greater than 0')
                return

            self.balance += amount

            print('Amount deposited successfully')
            print(f'Available balance: {self.balance:.2f}')

        except ValueError:
            print('Enter a valid amount')

    # withdraw is used to withdraw the amount from the account
    def withdraw(self):
        try:
            amount = float(input('Enter withdrawal amount: '))

            if amount <= 0:
                print('Amount must be greater than 0')
                return

            if amount > self.balance:
                print('Insufficient balance')
                return

            self.balance -= amount

            print('Withdrawal successful')
            print(f'Available balance: {self.balance:.2f}')

        except ValueError:
            print('Enter a valid amount')

# The main function is the entry point of the ATM simulation system. It creates an instance of the ATM class and provides a menu for the user to interact with. The user can check their balance, deposit money, withdraw money, or exit the program. The program will continue to run until the user chooses to exit.
def main():
    atm = ATM()

    while True:
        print('ATM Simulation System')
        print('1. Check Balance')
        print('2. Deposit')
        print('3. Withdraw')
        print('4. Exit')

        choice = input('Enter your choice: ').strip()

        if choice == '1':
            atm.check_balance()
        elif choice == '2':
            atm.deposit()
        elif choice == '3':
            atm.withdraw()
        elif choice == '4':
            print('Thank you')
            break
        else:
            print('Invalid choice')


main()