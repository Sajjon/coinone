require "coinone/account/account_info"
require "coinone/account/balance"
require "coinone/account/daily_balance"
require "coinone/account/deposit_address"
require "coinone/account/virtual_account"

module Coinone

  class Account

    attr_reader :connection
    attr_reader :account_info, :balance, :daily_balance, :deposit_address, :virtual_account

    def initialize(options={}, connection=nil)

      @connection = connection || Connection.factory(options)
      @account_info = AccountInfo.new()
      @balance = Balance.new()
      @daily_balance = DailyBalance.new()
      @deposit_address = DepositAddress.new()
      @virtual_account = VirtualAccount.new()

    end


    def get_user_info
      response = @connection.post( "/v2/account/user_info/")

      @account_info.update_user_info(response)
      @account_info

    end

    def get_balance

      response = @connection.post("/v2/account/balance/")

      @balance.update_balance(response)
      @balance

    end

    def get_daily_balance

      response = @connection.post("/v2/account/daily_balance/")

      @daily_balance.update_balance(response)
      @daily_balance

    end

    def get_deposit_address

      response = @connection.post("/v2/account/deposit_address/")

      @deposit_address.update_address(response)
      @deposit_address

    end

    def get_virtual_account

      response = @connection.post("/v2/account/virtual_account/")

      @virtual_account.update_virtual_account(response)
      @virtual_account

    end




=begin
    def security_level
      return @security_level
    end

    def security_level=(new_security_level)
      @security_level = new_security_level
    end
=end


  end
end
