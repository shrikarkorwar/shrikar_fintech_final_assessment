

class ApiEndPoints {
static const currencyAPI = 'fca_live_0xTIiJf9XsmEVZYBjTx7WGLFmvLDJDqJfMGy978o';
static const currencyAPIUrl = 'https://api.freecurrencyapi.com/v1/latest?apikey=<API_KEY_HERE>&base_currency=INR';
static const baseUrl = 'https://api.freecurrencyapi.com/';
}
/*
Transaction Data should have
- transactionId
- transactionDate
- transactionAmount
- transactionType
- transactionCategory
- transactionNote
 
 
Transaction Types:
- Income
- Expense
 
 
Transaction Categories:
- Salary
- Rent
- Grocery
- Shopping
- Fuel
- Entertainment
- Other
 
User Data should have
- userId
- userName
- userEmail
- userPassword
- userTransactions
- userCurrency
- monthlyLimit
- userBalance
- userIncome
- userExpense
*/
