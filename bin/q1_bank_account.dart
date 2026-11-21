class BankAccount {
  static int _nextID = 1;
  final int accountID;
  double _balance;

  BankAccount(double initialBalance)
    : accountID = _nextID++,
      _balance = initialBalance {
    if (!initialBalance.isFinite || initialBalance < 0) {
      throw ArgumentError.value(initialBalance, 'initialBalance');
    }
  }

  BankAccount.empty() : this(0);

  double get balance => _balance;

  bool withdraw(double amount) {
    if (!amount.isFinite || amount <= 0 || amount > _balance) {
      return false;
    }
    _balance -= amount;
    return true;
  }

  bool deposit(double amount) {
    if (!amount.isFinite || amount <= 0 || !(_balance + amount).isFinite) {
      return false;
    }
    _balance += amount;
    return true;
  }
}

void main() {
  final account = BankAccount(100);
  final emptyAccount = BankAccount.empty();

  account.deposit(50);
  account.withdraw(40);
  print('Withdrawal of 200 accepted: ${account.withdraw(200)}');
  print('Account ${account.accountID}: ${account.balance}');
  print('Account ${emptyAccount.accountID}: ${emptyAccount.balance}');
}
