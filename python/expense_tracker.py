import os
# os module is used to check if the file exists or not

from datetime import datetime
# datetime module is used to get the current date and time

file_name = 'expenses.txt'

# class Expense is used to store the details of an expense
class Expense:
    def __init__(self,date,category,amount,description):
        self.date = date
        self.category = category
        self.amount = amount
        self.description = description

# add_expense function to add a new expense
def add_expense():
    try:
        category = input('Enter category: ').strip()
        if not category:
            print('Category cannot be empty')
            return

        amount = float(input('Enter amount: '))
        if amount <= 0:
            print('Amount must be greater than 0')
            return

        description = input('Enter description: ').strip()
        if not description:
            print('Description cannot be empty')
            return

        date = datetime.now().strftime('%d-%m-%Y')
        expense = Expense(date,category,amount,description)

        with open(file_name,'a') as file:
            file.write(f'{expense.date}|{expense.category}|{expense.amount}|{expense.description} \n')

        print('Expense added successfully')

    except ValueError:
        print('Enter a valid amount')

# view_expenses function to view all expenses
def view_expenses():
    if not os.path.exists(file_name):
        print('No expenses found')
        return

    with open(file_name,'r') as file:
        expenses = file.readlines()

    if not expenses:
        print('No expenses found')
        return

    print('Expense Details')
    print('-' * 60)

    for expense in expenses:
        data = expense.strip().split('|')

        if len(data) == 4:
            print(f'Date        : {data[0]}')
            print(f'Category    : {data[1]}')
            print(f'Amount      : {data[2]}')
            print(f'Description : {data[3]}')
            print('-' * 60)

# total_expense function to calculate the total expense
def total_expense():
    if not os.path.exists(file_name):
        print('No expenses found')
        return

    total = 0

    with open(file_name,'r') as file:
        for expense in file:
            data = expense.strip().split('|')

            if len(data) == 4:
                try:
                    total += float(data[2])
                except ValueError:
                    continue

    print(f'Total expense: {total:.2f}')

# main function to display the menu and take user input
def main():
    while True:
        print('Mini Expense Tracker')
        print('1. Add Expense')
        print('2. View Expenses')
        print('3. Total Expense')
        print('4. Exit')

        choice = input('Enter your choice: ').strip()

        if choice == '1':
            add_expense()
        elif choice == '2':
            view_expenses()
        elif choice == '3':
            total_expense()
        elif choice == '4':
            print('Thank you')
            break
        else:
            print('Invalid choice')

main()