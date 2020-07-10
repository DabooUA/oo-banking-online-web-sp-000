class Transfer

  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction

    if @sender.balance < @amount
       @status = "rejected"
       return "Transaction rejected. Please check your account balance."

    else @sender.balance > @amount && @status == "pending"
       @sender.balance -= @amount
       @receiver.balance += @amount
       @status = "complete"

    #else @status = "rejected"
    #  return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
       @sender.balance += @amount
       @receiver.balance -= @amount
       @status = "reversed"
    end
  end

end
